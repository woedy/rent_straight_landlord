import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_straight_landlord/Components/keyboard_utils.dart';
import 'package:rent_straight_landlord/UploadHouse/upload_house_4.dart';
import 'package:rent_straight_landlord/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UploadHouse3 extends StatefulWidget {
  const UploadHouse3({super.key});

  @override
  State<UploadHouse3> createState() => _UploadHouse3State();
}

class _UploadHouse3State extends State<UploadHouse3> {

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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/map2.png"),
              fit: BoxFit.cover
            )
          ),
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
                  child: Container()),
              SizedBox(
                height: 10,
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


                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UploadHouse4()));
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
    );
  }




}
