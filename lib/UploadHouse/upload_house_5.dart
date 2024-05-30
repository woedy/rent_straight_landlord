import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent_straight_landlord/Components/keyboard_utils.dart';
import 'package:rent_straight_landlord/UploadHouse/upload_house_3.dart';
import 'package:rent_straight_landlord/UploadHouse/upload_house_6.dart';
import 'package:rent_straight_landlord/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Components/photos/select_photo_options_screen.dart';


class UploadHouse5 extends StatefulWidget {
  const UploadHouse5({super.key});

  @override
  State<UploadHouse5> createState() => _UploadHouse5State();
}

class _UploadHouse5State extends State<UploadHouse5> {

  PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;

  final _formKey = GlobalKey<FormState>();
  File? _image;

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
                        Text("Determine rental Price",
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
                height: 100,
              ),
              Expanded(
                  child: ListView(
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),                                child:Form(
                        //key: _formKey,
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.black.withOpacity(0.1))
                                  ),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Stack(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            _showSelectPhotoOptions(context);
                                          },
                                          child: _image == null
                                              ? Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.list_alt_outlined,
                                                  size: 50,
                                                  color: Colors.black,
                                                ),
                                                SizedBox(height: 20),
                                                Text(
                                                  "Upload property policy  document",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 12
                                                  ),
                                                ),
                                                SizedBox(height: 20),
                                                /*   Text(
                                                  "(Optional)",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(color: Colors.grey),
                                                ),*/
                                              ],
                                            ),
                                          )
                                              : CircleAvatar(
                                            backgroundImage: FileImage(_image!),
                                            radius: 200.0,
                                          ),
                                        ),
                                        if (_image != null)
                                          Positioned(
                                            bottom: 10,
                                            right: 10,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  _image = null;
                                                });
                                              },
                                              child: Icon(Icons.delete_forever, color: Colors.white),
                                              style: ElevatedButton.styleFrom(
                                                shape: CircleBorder(),
                                                padding: EdgeInsets.all(8),
                                                backgroundColor: Colors.red, // Set the background color directly using backgroundColor
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                      ),


                      SizedBox(
                        height: 15,
                      ),


                    ],
                  )),

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


                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UploadHouse6()));
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UploadHouse5()));
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


  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }


  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
    await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }



  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }




}
