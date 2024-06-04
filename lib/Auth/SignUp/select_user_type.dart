import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent_straight_landlord/Auth/SignUp/password.dart';
import 'package:rent_straight_landlord/Auth/SignUp/subscription.dart';
import 'package:rent_straight_landlord/Auth/SignUp/upload_card.dart';
import 'package:rent_straight_landlord/Components/photos/select_photo_options_screen.dart';
import 'package:rent_straight_landlord/constants.dart';

class SelectUserType extends StatefulWidget {
  final full_name;
  //final username;
  //final email;
  //final contact_number;
  const SelectUserType({super.key,
    required this.full_name,
    //required this.username,
    //required this.email,
    //required this.contact_number,
  });

  @override
  State<SelectUserType> createState() => _SelectUserTypeState();
}

class _SelectUserTypeState extends State<SelectUserType> with SingleTickerProviderStateMixin {
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

                        Text("Select your user type", style: TextStyle(fontSize: 20, fontFamily: "MontserratAlternates",  fontWeight: FontWeight.w500, height: 1.1)),
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
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.all(15),

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
                            child: Row(
                              children: [
                                Image(image: AssetImage("assets/icons/bi_house-up.png")),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Subscription(
                                        full_name: widget.full_name,


                                      )));
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Landlord", style: TextStyle(fontSize: 20, fontFamily: "MontserratAlternates",  fontWeight: FontWeight.w500, height: 1.1)),
                                        Text("rent out your building, or accommodation.", style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates",  fontWeight: FontWeight.w300, height: 1.1)),
                                      ],

                                    ),
                                  ),
                                ),
                                Icon(Icons.circle_outlined, color: rentPrimary,)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.all(15),

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
                            child: Row(
                              children: [
                                Image(image: AssetImage("assets/icons/bi_house-gear.png")),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: (){

                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text("Unavailable at the moment.",),
                                          backgroundColor: Colors.red,
                                        ),
                                      );

                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Agent", style: TextStyle(fontSize: 20, fontFamily: "MontserratAlternates",  fontWeight: FontWeight.w500, height: 1.1)),
                                        Text("take on the active role of a landlord", style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates",  fontWeight: FontWeight.w300, height: 1.1)),
                                      ],

                                    ),
                                  ),
                                ),
                                Icon(Icons.circle_outlined, color: rentPrimary,)
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





}
