import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:rent_straight_landlord/Auth/SignIn/sign_in_screen.dart';
import 'package:rent_straight_landlord/Auth/SignUp/email_verification.dart';
import 'package:rent_straight_landlord/Auth/SignUp/models/sign_up_model.dart';
import 'package:rent_straight_landlord/Auth/SignUp/sign_up_screen.dart';
import 'package:rent_straight_landlord/Auth/SignUp/upload_card.dart';
import 'package:rent_straight_landlord/Components/keyboard_utils.dart';
import 'package:rent_straight_landlord/constants.dart';



Future<SignUpModel> signUpUser(String full_name, String username, String email, String contact_number, String password, String password_confirmation) async {

  final response = await http.post(
    Uri.parse(hostName + "register"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json'
    },
    body: jsonEncode({
      "full_name": full_name,
      "username": username,
      "email": email,
      "phone_number": contact_number,
      "password": password,
      "password_confirmation": password_confirmation,
    }),
  );


  if (response.statusCode == 201) {
    print(jsonDecode(response.body));
    final result = json.decode(response.body);
    if (result != null) {

      print(result['data']['token']);

      await saveIDApiKey(result['data']['token'].toString());
      await saveUserData(result['data']);


    }
    return SignUpModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    print(jsonDecode(response.body));
    return SignUpModel.fromJson(jsonDecode(response.body));
  }  else if (response.statusCode == 403) {
    print(jsonDecode(response.body));
    return SignUpModel.fromJson(jsonDecode(response.body));
  }  else {
    print(jsonDecode(response.body));
    throw Exception('Failed to Sign Up');
  }
}


class PasswordScreen extends StatefulWidget {
  final full_name;
  final username;
  final email;
  final contact_number;

  const PasswordScreen({super.key, required this.full_name, this.username, this.email, required this.contact_number});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  //Future<SignInModel>? _futureSignIn;
  FocusNode focusNode = FocusNode();

  var show_password = false;
  String? password;
  String? password_confirmation;

  late AnimationController _controller;

  Future<SignUpModel>? _futureSignUp;






  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return (_futureSignUp == null) ? buildColumn() : buildFutureBuilder();
  }


  buildColumn(){

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Colors.white
          ),
          child: Stack(
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Image.asset("assets/images/rent_logo.png"),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.full_name + ", ", style: TextStyle(fontSize: 36, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2),),
                        SizedBox(
                          height: 15,
                        ),

                        Text("Protect your account", style: TextStyle(fontSize: 20, fontFamily: "MontserratAlternates",  fontWeight: FontWeight.w500, height: 1.1)),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),


                  Expanded(
                      child: ListView(
                        children: [
                          Container(
                            child: Column(
                              children: [

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(15),
                                                  border:
                                                  Border.all(color: Colors.black.withOpacity(0.1))),
                                              child: TextFormField(
                                                style: TextStyle(color: Colors.black),
                                                decoration: InputDecoration(
                                                  //hintText: 'Enter Password',
                                                    suffixIcon: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          show_password = !show_password;
                                                        });
                                                      },
                                                      icon: Icon(
                                                        show_password
                                                            ? Icons.remove_red_eye_outlined
                                                            : Icons.remove_red_eye,
                                                        color: Colors.black.withOpacity(0.5),
                                                      ),
                                                    ),
                                                    hintStyle: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight: FontWeight.normal),
                                                    labelText: "Password",
                                                    labelStyle:
                                                    TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.5)),
                                                    enabledBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.white)),
                                                    focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.white)),
                                                    border: InputBorder.none),
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(225),
                                                  PasteTextInputFormatter(),
                                                ],
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Password is required';
                                                  }
                                                  if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[-!@#\$%^&*_()\-+=/.,<>?"~`£{}|:;])')
                                                      .hasMatch(value)) {

                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        content: Text("- Password must be at least 8 characters long\n- Must include at least one uppercase letter,\n- One lowercase letter, one digit,\n- And one special character",),
                                                        backgroundColor: Colors.red,
                                                      ),
                                                    );
                                                    return '';
                                                  }
                                                  return null;
                                                },
                                                onChanged: (value) {
                                                  setState(() {
                                                    password = value;
                                                  });
                                                },
                                                textInputAction: TextInputAction.next,
                                                obscureText: show_password ? false : true,
                                                onSaved: (value) {
                                                  setState(() {
                                                    password = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(15),
                                                  border:
                                                  Border.all(color: Colors.black.withOpacity(0.1))),
                                              child: TextFormField(
                                                style: TextStyle(color: Colors.black),
                                                decoration: InputDecoration(
                                                  //hintText: 'Enter Password',
                                                    suffixIcon: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          show_password = !show_password;
                                                        });
                                                      },
                                                      icon: Icon(
                                                        show_password
                                                            ? Icons.remove_red_eye_outlined
                                                            : Icons.remove_red_eye,
                                                        color: Colors.black.withOpacity(0.5),
                                                      ),
                                                    ),
                                                    hintStyle: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight: FontWeight.normal),
                                                    labelText: "Re-Enter Password",
                                                    labelStyle:
                                                    TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.5)),
                                                    enabledBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.white)),
                                                    focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.white)),
                                                    border: InputBorder.none),
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(225),
                                                  PasteTextInputFormatter(),
                                                ],
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Password is required';
                                                  }
                                                  if (value != password) {
                                                    return 'Passwords do not match';
                                                  }
                                                  return null;
                                                },
                                                onChanged: (value) {
                                                  setState(() {
                                                    password_confirmation = value;
                                                  });
                                                },
                                                textInputAction: TextInputAction.next,
                                                obscureText: show_password ? false : true,
                                                onSaved: (value) {
                                                  setState(() {
                                                    password_confirmation = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ),


                                SizedBox(
                                  height: 30,
                                ),

                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),

                                  child: InkWell(
                                    onTap: () {





/*

                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        KeyboardUtil.hideKeyboard(context);


                                        print(widget.full_name);
                                        print(widget.username);
                                        print(widget.email);
                                        print(widget.contact_number);
                                        print(password);
                                        print(password_confirmation);

                                        _futureSignUp = signUpUser(
                                          widget.full_name,
                                          widget.username,
                                          widget.email,
                                          widget.contact_number,
                                          password.toString(),
                                          password_confirmation.toString(),
                                        );



                                      }

*/

                                                 _showLoadingDialogModal(context);

                                      Timer(
                                          Duration(seconds: 4),
                                              () {
                                            Navigator.of(context).pop();
                                            _showSuccessDialogModal(context);

                                            Timer(
                                                Duration(seconds: 3),
                                                    () {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => UploadCard(
                                                      full_name: "full_name",
                                                      username: "username",
                                                      email: "email",
                                                      contact_number: "contact_number")));

                                                }
                                            );
                                          }
                                      );



                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      //margin: EdgeInsets.all(10),
                                      height: 59,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: rentPrimary,
                                          borderRadius: BorderRadius.circular(15)),
                                      child: Center(
                                        child: Text(
                                          "Set up Account",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),




                              ],
                            ),
                          ),
                        ],
                      )
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }


  FutureBuilder<SignUpModel> buildFutureBuilder() {
    return FutureBuilder<SignUpModel>(
        future: _futureSignUp,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _showLoadingDialogModal(context);
            });
          }
          else if(snapshot.hasData) {

            var data = snapshot.data!;

            print("#########################");
            //print(data.data!.token!);


            if(data.message == "Registration successful") {


              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

                _showSuccessDialogModal(context);


                setState(() {
                  _futureSignUp = null; // Reset _futureSignIn here
                });


                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => EmailVerification(
                    full_name: widget.full_name,

                    username: widget.username,
                    email: widget.email,
                    contact_number: widget.contact_number,
                  )),
                );

             /*   setState(() {
                  _futureSignUp = null; // Reset _futureSignIn here
                });
*/




/*
                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      // Show the dialog
                      return SuccessDialogBox(text: "Registration Successful");
                    }
                );
*/





              });

            }

            else if(data.message == "The email has already been taken."){
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {



                _showErrorDialogModal(context);


                setState(() {
                  _futureSignUp = null; // Reset _futureSignIn here
                });



                Future.delayed(Duration(milliseconds: 700), () {

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                        (route) => false,
                  );


                });









     /*           showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      // Show the dialog
                      return ErrorDialogBox(text: "The email has already been taken.");
                    }
                );*/





              });

            }



          }

          return Scaffold(
            body:Container(),
          );


        }
    );
  }


  void _showLoadingDialogModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/rent_logo.png"),
                    SizedBox(
                      width: 10,
                    ),

                    Text("RentStraight", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500, height: 1.2),),


                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                Text("is setting up your account", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, height: 1.2),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RotationTransition(
                      turns: _controller,
                      child: Image.asset(
                        "assets/icons/loading.png",
                        color: Colors.black,

                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        );
      },
    );
  }

  void _showErrorDialogModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/rent_logo.png"),
                    SizedBox(
                      width: 10,
                    ),

                    Text("RentStraight", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500, height: 1.2),),


                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                Text("The email has already been taken.", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, height: 1.2),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.highlight_remove, color: Colors.red, size: 50,)
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSuccessDialogModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
        /*      image: DecorationImage(
                image: AssetImage("assets/images/sprinkles.png"),
                fit: BoxFit.cover
              )*/
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/rent_logo.png"),
                    SizedBox(
                      width: 10,
                    ),

                    Text("RentStraight", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500, height: 1.2),),


                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                Text("Account Setup Successful", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500, height: 1.2),),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.check_circle_outline_rounded, color: Colors.green, size: 55,),
                  ],
                ),

              ],
            ),
          ),
        );
      },
    );
  }

}
