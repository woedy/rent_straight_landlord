import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:rent_straight_landlord/Auth/Password/models/reset_password_model.dart';
import 'package:rent_straight_landlord/Auth/SignIn/sign_in_screen.dart';
import 'package:rent_straight_landlord/Components/keyboard_utils.dart';
import 'package:rent_straight_landlord/constants.dart';



Future<ResetPasswordModel> resetPassword(String email, String token, String password, String password_confirmation) async {

  final response = await http.post(
    Uri.parse(hostName + "reset-password"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json'
    },
    body: jsonEncode({
      "email": email,
      "token": token,
      "password": password,
      "password_confirmation": password_confirmation,
    }),
  );


  if (response.statusCode == 201) {
    print(jsonDecode(response.body));

    return ResetPasswordModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {

    print(jsonDecode(response.body));
    return ResetPasswordModel.fromJson(jsonDecode(response.body));
  }  else if (response.statusCode == 403) {
    print(jsonDecode(response.body));
    return ResetPasswordModel.fromJson(jsonDecode(response.body));
  }  else {
    print(jsonDecode(response.body));
    throw Exception('Failed to Sign Up');
  }
}


class ResetPasswordScreen extends StatefulWidget {

  final email;
  final token;

  const ResetPasswordScreen({super.key, required this.email, required this.token});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  //Future<SignInModel>? _futureSignIn;
  FocusNode focusNode = FocusNode();

  var show_password = false;
  String? password;
  String? password_confirmation;

  late AnimationController _controller;

  Future<ResetPasswordModel>? _futureResetPassword;






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
    return (_futureResetPassword == null) ? buildColumn() : buildFutureBuilder();
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
                        Text("Reset Password", style: TextStyle(fontSize: 36, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2),),
                        SizedBox(
                          height: 15,
                        ),

                        Text("Enter your new Password", style: TextStyle(fontSize: 20, fontFamily: "MontserratAlternates",  fontWeight: FontWeight.w500, height: 1.1)),
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






                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        KeyboardUtil.hideKeyboard(context);


                                        print(widget.email);
                                        print(password);
                                        print(password_confirmation);

                                        _futureResetPassword = resetPassword(
                                          widget.email,
                                          widget.token,
                                          password.toString(),
                                          password_confirmation.toString(),
                                        );



                                      }


                                      /*           _showLoadingDialogModal(context);

                                      Timer(
                                          Duration(seconds: 4),
                                              () {
                                            Navigator.of(context).pop();
                                            _showSuccessDialogModal(context);

                                            Timer(
                                                Duration(seconds: 3),
                                                    () {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));

                                                }
                                            );
                                          }
                                      );

*/


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
                                          "Reset Password",
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


  FutureBuilder<ResetPasswordModel> buildFutureBuilder() {
    return FutureBuilder<ResetPasswordModel>(
        future: _futureResetPassword,
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


            if(data.message == "Password reset successful") {


              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

                _showSuccessDialogModal(context);


                setState(() {
                  _futureResetPassword = null; // Reset _futureSignIn here
                });


                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );


                _showSuccessDialogModal(context);





              });

            }

            else {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {



                _showErrorDialogModal(context, data);


                setState(() {
                  _futureResetPassword = null; // Reset _futureSignIn here
                });



/*                Future.delayed(Duration(milliseconds: 700), () {

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Sign()),
                        (route) => false,
                  );


                });*/



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

                Text("is resetting your password", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, height: 1.2),),
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

  void _showErrorDialogModal(BuildContext context, ResetPasswordModel model) {
    List<Widget> errorWidgets = [];
    if (model.errors != null) {
      if (model.errors!.email != null) {
        model.errors!.email!.forEach((error) {
          errorWidgets.add(Text(error));
        });
      }
      if (model.errors!.password != null) {
        model.errors!.password!.forEach((error) {
          errorWidgets.add(Text(error));
        });
      }
      if (model.errors!.token != null) {
        model.errors!.token!.forEach((error) {
          errorWidgets.add(Text(error));
        });
      }
    }

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
                    SizedBox(width: 10),
                    Text(
                      "RentStraight",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: errorWidgets,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.highlight_remove, color: Colors.red, size: 50),
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

                Text("Password Reset Successful", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500, height: 1.2),),
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
