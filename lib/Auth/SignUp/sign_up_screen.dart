import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:http/http.dart' as http;
import 'package:rent_straight_landlord/Auth/SignUp/models/sign_up_model.dart';
import 'package:rent_straight_landlord/Auth/SignUp/upload_photo.dart';
import 'package:rent_straight_landlord/Components/keyboard_utils.dart';
import 'package:rent_straight_landlord/constants.dart';


Future<SignUpModel> verifyDetails(String full_name, String username, String email, String contact_number, String password, String password_confirmation) async {

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
    }),
  );


  if (response.statusCode == 201) {
    print(jsonDecode(response.body));
    final result = json.decode(response.body);
    if (result != null) {

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


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with SingleTickerProviderStateMixin  {
  final _formKey = GlobalKey<FormState>();
  var show_password = false;

  //Future<SignInModel>? _futureSignIn;
  FocusNode focusNode = FocusNode();

  Future<SignUpModel>? _futureVerifyDetail;
  late AnimationController _controller;



  String? email;
  String? password;

  String? full_name;
  String? phone;
  String? _code;
  String? _number;
  String? username;
  String? country;



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
    return (_futureVerifyDetail == null) ? buildColumn() : buildFutureBuilder();
  }





  buildColumn(){
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Image.asset("assets/images/rent_logo.png"),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                              fontSize: 64,
                              fontFamily: "MontserratAlternates",
                              fontWeight: FontWeight.w500,
                              height: 1.2),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Lets get you started",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "MontserratAlternates",
                                fontWeight: FontWeight.w500,
                                height: 1.1)),
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
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.black
                                                          .withOpacity(0.1))),
                                              child: TextFormField(
                                                style: TextStyle(color: Colors.black),
                                                decoration: InputDecoration(
                                                  //hintText: 'Enter Username/Email',

                                                  hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight: FontWeight.normal),
                                                  labelText: "Full name",
                                                  labelStyle: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.black
                                                          .withOpacity(0.5)),
                                                  enabledBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.white)),
                                                  focusedBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.white)),
                                                  border: InputBorder.none,
                                                ),
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(
                                                      225),
                                                  PasteTextInputFormatter(),
                                                ],
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Full name is required';
                                                  }
                                                  if (value.length < 3) {
                                                    return 'Full name too short';
                                                  }
                                                },
                                                textInputAction: TextInputAction.next,
                                                autofocus: false,
                                                onSaved: (value) {
                                                  setState(() {
                                                    full_name = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                  border: Border.all(
                                                      color: Colors.black
                                                          .withOpacity(0.1))),
                                              child: TextFormField(
                                                style: TextStyle(color: Colors.black),
                                                decoration: InputDecoration(
                                                  //hintText: 'Enter Username/Email',

                                                  hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight: FontWeight.normal),
                                                  labelText: "Email",
                                                  labelStyle: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.black
                                                          .withOpacity(0.5)),
                                                  enabledBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.white)),
                                                  focusedBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.white)),
                                                  border: InputBorder.none,
                                                ),
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(
                                                      225),
                                                  PasteTextInputFormatter(),
                                                ],
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Email is required';
                                                  }

                                                  String pattern =
                                                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                                      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                                      r"{0,253}[a-zA-Z0-9])?)*$";
                                                  RegExp regex = RegExp(pattern);
                                                  if (!regex.hasMatch(value))
                                                    return 'Enter a valid email address';

                                                  return null;
                                                },
                                                textInputAction: TextInputAction.next,
                                                autofocus: false,
                                                onSaved: (value) {
                                                  setState(() {
                                                    email = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.black
                                                          .withOpacity(0.1))),
                                              child: TextFormField(
                                                style: TextStyle(color: Colors.black),
                                                decoration: InputDecoration(
                                                  //hintText: 'Enter Username/Email',

                                                  hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight: FontWeight.normal),
                                                  labelText: "Username",
                                                  labelStyle: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.black
                                                          .withOpacity(0.5)),
                                                  enabledBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.white)),
                                                  focusedBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.white)),
                                                  border: InputBorder.none,
                                                ),
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(
                                                      225),
                                                  PasteTextInputFormatter(),
                                                ],
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Username is required';
                                                  }
                                                  if (value.length < 3) {
                                                    return 'Username too short';
                                                  }
                                                },
                                                textInputAction: TextInputAction.next,
                                                autofocus: false,
                                                onSaved: (value) {
                                                  setState(() {
                                                    username = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            IntlPhoneField(
                                              focusNode: focusNode,
                                              style: TextStyle(color: Colors.black),
                                              dropdownIcon: Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.grey,
                                              ),
                                              decoration: InputDecoration(
                                                // labelText: 'Phone Number',
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                    ),
                                                  ),
                                                  enabledBorder:
                                                  new OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black
                                                            .withOpacity(0.1)),
                                                  ),
                                                  focusedBorder:
                                                  new OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black
                                                            .withOpacity(0.1)),
                                                  )),
                                              languageCode: "en",
                                              initialCountryCode: "GH",
                                              validator: (e) {
                                                if (e == null) {
                                                  return 'Phone Number required';
                                                }
                                                return null;
                                              },
                                              onChanged: (value) {
                                                _code = value.countryCode.toString();
                                                _number = value.number.toString();
                                                country =
                                                    value.countryISOCode.toString();
                                              },
                                              onCountryChanged: (country) {},
                                              onSaved: (value) {
                                                //_onSaveForm(value.toString());
                                                setState(() {
                                                  _code =
                                                      value!.countryCode.toString();
                                                  _number = value.number.toString();
                                                  country =
                                                      value.countryISOCode.toString();
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        InkWell(
                                          onTap: () {



                                            if (_formKey.currentState!.validate()) {
                                              _formKey.currentState!.save();
                                              KeyboardUtil.hideKeyboard(context);


                                              print("###############");
                                              print(full_name);
                                              print(username);
                                              print(email);
                                              phone = _code.toString() + _number.toString();
                                              print(phone);


                                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UploadPhoto(
                                                  full_name: full_name,
                                                  username: username,
                                                  email: email,
                                                  contact_number: phone
                                              )));


                                              /*     Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => PasswordScreen(
                                            full_name: full_name,
                                            username: username,
                                            email: email,
                                            contact_number: phone
                                          )));

*/
                                            }

                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(20),
                                            //margin: EdgeInsets.all(10),
                                            height: 59,
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                                color: rentPrimary,
                                                borderRadius:
                                                BorderRadius.circular(15)),
                                            child: Center(
                                              child: Text(
                                                "Continue",
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Already have an account? ",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        "Sign in here",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: rentPrimary),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
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
        future: _futureVerifyDetail,
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
                  _futureVerifyDetail = null; // Reset _futureSignIn here
                });


       /*         Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => EmailVerification(
                    full_name: widget.full_name,
                    username: widget.username,
                    email: widget.email,
                    contact_number: widget.contact_number,
                  )),
                );*/

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
                  _futureVerifyDetail = null; // Reset _futureSignIn here
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
