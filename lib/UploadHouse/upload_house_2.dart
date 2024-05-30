import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_straight_landlord/Components/keyboard_utils.dart';
import 'package:rent_straight_landlord/UploadHouse/upload_house_3.dart';
import 'package:rent_straight_landlord/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UploadHouse2 extends StatefulWidget {
  const UploadHouse2({super.key});

  @override
  State<UploadHouse2> createState() => _UploadHouse2State();
}

class _UploadHouse2State extends State<UploadHouse2> {

  PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;

  final _formKey = GlobalKey<FormState>();

  Map<String, dynamic> userData = {};


  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(15),
          child: Column(

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 1), // changes position of shadow
                            ),
                          ],

                        ),
                        child: Icon(Icons.arrow_back, color: rentPrimary, size: 40,)),
                  ),
                  Row(
                    children: [
           ],
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/images/fred.png"),
                          fit: BoxFit.cover
                      )

                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    //padding: EdgeInsets.symmetric(horizontal: 15),
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
                          height: 5,
                        ),
                        Text("Help us locate your house",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "MontserratAlternates",
                                fontWeight: FontWeight.w500,
                                height: 1.1)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                  child: ListView(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 0),
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
                                              labelText: "Street Address Line 1",
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
                                                return 'Property name is required';
                                              }
                                              if (value.length < 3) {
                                                return 'Property name too short';
                                              }
                                            },
                                            textInputAction: TextInputAction.next,
                                            autofocus: false,
                                            onSaved: (value) {
                                              setState(() {
                                                //property_name = value;
                                              });
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
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
                                              labelText: "City",
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
                                                return 'Property name is required';
                                              }
                                              if (value.length < 3) {
                                                return 'Property name too short';
                                              }
                                            },
                                            textInputAction: TextInputAction.next,
                                            autofocus: false,
                                            onSaved: (value) {
                                              setState(() {
                                                //property_name = value;
                                              });
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
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
                                              labelText: "State/Providence",
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
                                                return 'Property name is required';
                                              }
                                              if (value.length < 3) {
                                                return 'Property name too short';
                                              }
                                            },
                                            textInputAction: TextInputAction.next,
                                            autofocus: false,
                                            onSaved: (value) {
                                              setState(() {
                                                //property_name = value;
                                              });
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
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
                                              labelText: "Zip/Postal Code",
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
                                                return 'Property name is required';
                                              }
                                              if (value.length < 3) {
                                                return 'Property name too short';
                                              }
                                            },
                                            textInputAction: TextInputAction.next,
                                            autofocus: false,
                                            onSaved: (value) {
                                              setState(() {
                                                //property_name = value;
                                              });
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
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
                                              labelText: "Street Address Line 2",
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
                                                return 'Property name is required';
                                              }
                                              if (value.length < 3) {
                                                return 'Property name too short';
                                              }
                                            },
                                            textInputAction: TextInputAction.next,
                                            autofocus: false,
                                            onSaved: (value) {
                                              setState(() {
                                                //property_name = value;
                                              });
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      onTap: () {



                               /*         if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          KeyboardUtil.hideKeyboard(context);


                                          print("###############");


                               *//*           Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UploadPhoto(
                                              full_name: full_name,

                                          )));
*//*

                                        }*/


                                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UploadHouse3()));
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
                                            "Confirm Location",
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

                          ],
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),


                decoration: BoxDecoration(
                  color: rentDark,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){
                        /*      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => DashboardScreen()));
                      */  },
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: Icon(Icons.home, color: Colors.white, size: 30 ,))
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UploadHouse2()));
                      },
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: rentPrimary,
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: Icon(Icons.add, color: Colors.white, size: 30 ,))
                        ],
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ChatMessage()));
                      },
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: Icon(Icons.message, color: Colors.white, size: 30 ,))
                        ],
                      ),
                    ),



                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }




}
