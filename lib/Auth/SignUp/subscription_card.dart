import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent_straight_landlord/Auth/SignUp/upload_card.dart';
import 'package:rent_straight_landlord/Components/photos/select_photo_options_screen.dart';
import 'package:rent_straight_landlord/HomeScreen/home_screen.dart';
import 'package:rent_straight_landlord/constants.dart';

class SubscriptionCard extends StatefulWidget {
  final full_name;
  //final username;
  //final email;
  //final contact_number;
  const SubscriptionCard({super.key,
    required this.full_name,
    //required this.username,
    //required this.email,
    //required this.contact_number,
  });

  @override
  State<SubscriptionCard> createState() => _SubscriptionCardState();
}

class _SubscriptionCardState extends State<SubscriptionCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final _formKey = GlobalKey<FormState>();

  FocusNode focusNode = FocusNode();
  File? _image;



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
                        Text(widget.full_name +",", style: TextStyle(fontSize: 36, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2),),
                        SizedBox(
                          height: 15,
                        ),

                        Text("Select a subscription option", style: TextStyle(fontSize: 20, fontFamily: "MontserratAlternates",  fontWeight: FontWeight.w500, height: 1.1)),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [rentCream, rentLightblue],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),

                        borderRadius: BorderRadius.circular(10),

                  ),
                    child:   Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Plus Member", style: TextStyle(fontSize: 20, fontFamily: "Montserrat",  fontWeight: FontWeight.w700, height: 1.1, color: rentLightblue)),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Ghc9.99", style: TextStyle(fontSize: 24, fontFamily: "Montserrat",  fontWeight: FontWeight.w700, height: 1.1, color: rentPrimary)),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),


                  Expanded(
                      child:ListView(
                        children: [

                          Container(
                            margin:EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text("Name on card", style: TextStyle(fontSize: 12, fontFamily: "Montserrat",  fontWeight: FontWeight.w500, height: 1.1)),
                                SizedBox(
                                  height: 10,
                                ),
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
                                      labelText: "",
                                      labelStyle: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black
                                              .withOpacity(0.5)),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey)),
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
                                        return 'Name on Card is required';
                                      }
                                      if (value.length < 3) {
                                        return 'Name on Card too short';
                                      }
                                    },
                                    textInputAction: TextInputAction.next,
                                    autofocus: false,
                                    onSaved: (value) {
                                      setState(() {
                                      //  username = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          Container(
                            margin:EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text("Name on card", style: TextStyle(fontSize: 12, fontFamily: "Montserrat",  fontWeight: FontWeight.w500, height: 1.1)),
                                SizedBox(
                                  height: 10,
                                ),
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
                                      labelText: "",
                                      labelStyle: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black
                                              .withOpacity(0.5)),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey)),
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
                                        return 'Name on Card is required';
                                      }
                                      if (value.length < 3) {
                                        return 'Name on Card too short';
                                      }
                                    },
                                    textInputAction: TextInputAction.next,
                                    autofocus: false,
                                    onSaved: (value) {
                                      setState(() {
                                        //  username = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin:EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text("Expiry", style: TextStyle(fontSize: 12, fontFamily: "Montserrat",  fontWeight: FontWeight.w500, height: 1.1)),
                                      SizedBox(
                                        height: 10,
                                      ),
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
                                            labelText: "",
                                            labelStyle: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black
                                                    .withOpacity(0.5)),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey)),
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
                                              return 'Card Number is required';
                                            }
                                            if (value.length < 3) {
                                              return 'Card Number too short';
                                            }
                                          },
                                          textInputAction: TextInputAction.next,
                                          autofocus: false,
                                          onSaved: (value) {
                                            setState(() {
                                              //  username = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin:EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text("CVV", style: TextStyle(fontSize: 12, fontFamily: "Montserrat",  fontWeight: FontWeight.w500, height: 1.1)),
                                      SizedBox(
                                        height: 10,
                                      ),
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
                                            labelText: "",
                                            labelStyle: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black
                                                    .withOpacity(0.5)),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey)),
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
                                              return 'Card Number is required';
                                            }
                                            if (value.length < 3) {
                                              return 'Card Number too short';
                                            }
                                          },
                                          textInputAction: TextInputAction.next,
                                          autofocus: false,
                                          onSaved: (value) {
                                            setState(() {
                                              //  username = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),







                        ],
                      )
                  ),



                  InkWell(
                    onTap: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));


                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(10),
                      height: 59,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Pay",
                              style: TextStyle(color: Colors.green),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.lock,color: Colors.green,)
                          ],
                        ),
                      ),
                    ),
                  ),


                ],
              ),

            ],
          ),
        ),
      ),
    );
  }





}
