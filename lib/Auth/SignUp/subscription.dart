import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent_straight_landlord/Auth/SignUp/subscription_card.dart';
import 'package:rent_straight_landlord/Auth/SignUp/upload_card.dart';
import 'package:rent_straight_landlord/Components/photos/select_photo_options_screen.dart';
import 'package:rent_straight_landlord/constants.dart';

class Subscription extends StatefulWidget {
  final full_name;
  //final username;
  //final email;
  //final contact_number;
  const Subscription({super.key,
    required this.full_name,
    //required this.username,
    //required this.email,
    //required this.contact_number,
  });

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> with SingleTickerProviderStateMixin {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.circle_outlined, color: rentPrimary,),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Select the Pay as you go", style: TextStyle(fontSize: 16, color: rentPrimary, fontFamily: "MontserratAlternates",  fontWeight: FontWeight.w500, height: 1.1)),

                    ],
                  ),


                  Expanded(
                      child: PageView(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [rentCream, rentLightblue],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),

                              borderRadius: BorderRadius.circular(20)

                            ),
                            child: ListView(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(Icons.circle_outlined, color: rentPrimary,)
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Plus Member", style: TextStyle(fontSize: 36, fontFamily: "Montserrat",  fontWeight: FontWeight.w700, height: 1.1, color: rentLightblue)),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Ghc9.99", style: TextStyle(fontSize: 64, fontFamily: "Montserrat",  fontWeight: FontWeight.w700, height: 1.1, color: rentPrimary)),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Image(image: AssetImage("assets/icons/cross.png")),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(child: Text("One  (1) free Amateur League Event ", style: TextStyle(fontSize: 16, fontFamily: "MontserratAlternates",  fontWeight: FontWeight.w500, height: 1.1))),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          Image(image: AssetImage("assets/icons/cross.png")),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(child: Text("One  (1) free Amateur League Event ", style: TextStyle(fontSize: 16, fontFamily: "MontserratAlternates",  fontWeight: FontWeight.w500, height: 1.1))),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          Image(image: AssetImage("assets/icons/cross.png")),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(child: Text("One  (1) free Amateur League Event ", style: TextStyle(fontSize: 16, fontFamily: "MontserratAlternates",  fontWeight: FontWeight.w500, height: 1.1))),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          Image(image: AssetImage("assets/icons/cross.png")),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(child: Text("One  (1) free Amateur League Event ", style: TextStyle(fontSize: 16, fontFamily: "MontserratAlternates",  fontWeight: FontWeight.w500, height: 1.1))),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          Image(image: AssetImage("assets/icons/cross.png")),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(child: Text("One  (1) free Amateur League Event ", style: TextStyle(fontSize: 16, fontFamily: "MontserratAlternates",  fontWeight: FontWeight.w500, height: 1.1))),
                                        ],
                                      ),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.circle, color: rentLightblue, size: 15,),
                      Icon(Icons.circle, color: rentPrimary, size: 15,),
                      Icon(Icons.circle, color: rentLightblue, size: 15,),
                    ],
                  ),

                  InkWell(
                    onTap: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context) => SubscriptionCard(full_name: "full_name")));


                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(10),
                      height: 59,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: rentPrimary,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          "Subscribe",
                          style: TextStyle(color: Colors.white),
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
