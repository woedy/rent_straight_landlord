import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_straight_landlord/HomeScreen/home_screen.dart';
import 'package:rent_straight_landlord/LandloardProfile/edit_profile.dart';
import 'package:rent_straight_landlord/constants.dart';

import '../ChatScreen/chat_screen.dart';
import '../UploadHouse/upload_house_1.dart';

class LandlordProfile extends StatefulWidget {
  const LandlordProfile({super.key});

  @override
  State<LandlordProfile> createState() => _LandlordProfileState();
}

class _LandlordProfileState extends State<LandlordProfile> {

  PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;

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
                  InkWell(
                    onTap: (){
                     // Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfileScreen()));

                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage("assets/images/fred.png"),
                          fit: BoxFit.cover
                        )

                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/kirk2.png"),
                  ),
                  SizedBox(
                    width: 20,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Mr. Kirk Wolf", style: TextStyle(fontSize: 20, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),
                      SizedBox(
                        height: 10,
                      ),

                      Text("kirktettehbio@gmail.com", style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),


              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                    
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Ghc9.99", style: TextStyle(fontSize: 24, fontFamily: "Montserrat",  fontWeight: FontWeight.w700, height: 1.1, color: rentPrimary)),
                              Text("50 Days left", style: TextStyle(fontSize: 12, fontFamily: "Montserrat", height: 1.1, color: Colors.green)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
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
                        child: Column(
                          children: [
                            Text("15", style: TextStyle(fontSize: 24, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w600, height: 1.2, color: rentPrimary),),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Listing", style: TextStyle(fontSize: 10, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),

                          ],
                        )),
                    Container(
                        padding: EdgeInsets.all(20),
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
                        child: Column(
                          children: [
                            Text("4.5", style: TextStyle(fontSize: 24, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w600, height: 1.2, color: rentPrimary),),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Rating", style: TextStyle(fontSize: 10, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),

                          ],
                        )),
                    Container(
                        padding: EdgeInsets.all(20),
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
                        child: Column(
                          children: [
                            Text("250", style: TextStyle(fontSize: 24, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w600, height: 1.2, color: rentPrimary),),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Followers", style: TextStyle(fontSize: 10, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),

                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => EditUserProfile()));

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
                      "Edit Profile",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                    itemBuilder: (context, index){
                      return InkWell(
                        onTap: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => HouseInner1()));

                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 140,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/house_in.png"),
                                        fit: BoxFit.cover
                                    )

                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start ,
                                  children: [
                                    Text("St.Patrick Estate", style: TextStyle(fontSize: 20, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),
                                    Text("Ritz, Adenta | 3.5Km away", style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates", height: 1.2,),),
                                    SizedBox(
                                      height: 30,
                                    ),


                                    Container(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Icon(Icons.bed,color: Colors.black, size: 30,),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("3", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.black),),

                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Icon(Icons.food_bank,color: Colors.black, size: 30,),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("1", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.black),),

                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Icon(Icons.bathtub_rounded,color: Colors.black, size: 30,),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("3", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.black),),

                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
                        },
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: rentPrimary,
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: Icon(Icons.home, color: Colors.white, size: 30 ,))
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UploadHouse1()));
                      },
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: Icon(Icons.add, color: Colors.white, size: 30 ,))
                        ],
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ChatScreen()));
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
