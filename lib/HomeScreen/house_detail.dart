import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_straight_landlord/constants.dart';

class HouseDetails extends StatefulWidget {
  const HouseDetails({super.key});

  @override
  State<HouseDetails> createState() => _HouseDetailsState();
}

class _HouseDetailsState extends State<HouseDetails> {
  PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          //padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("assets/images/house_in.png"),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
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
                                            offset: Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: rentPrimary,
                                        size: 40,
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                )),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "St.Patrick Estate",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily:
                                                    "MontserratAlternates",
                                                fontWeight: FontWeight.w500,
                                                height: 1.2,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "Ritz, Adenta | 3.5Km away",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily:
                                                    "MontserratAlternates",
                                                fontWeight: FontWeight.w500,
                                                height: 1.2,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 80,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.green.withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Center(
                                            child: Text(
                                          "Available",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontFamily:
                                                  "MontserratAlternates",
                                              color: Colors.green),
                                        )),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.bed,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "3",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          "MontserratAlternates",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1.2,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.food_bank,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "1",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          "MontserratAlternates",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1.2,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.bathtub_rounded,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "3",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          "MontserratAlternates",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1.2,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.people_alt_outlined,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "1",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          "MontserratAlternates",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1.2,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.list_alt_outlined,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "3",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          "MontserratAlternates",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1.2,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: InkWell(
                      onTap: () {
                
                       // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UploadHouse6()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        //margin: EdgeInsets.all(10),
                        height: 59,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: rentDark,
                            borderRadius:
                            BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            "Tenant (10)",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: InkWell(
                      onTap: () {
                
                       // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UploadHouse6()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        //margin: EdgeInsets.all(10),
                        height: 59,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: rentCream,
                            borderRadius:
                            BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            "Agent (10)",
                            style: TextStyle(color: rentDark),
                          ),
                        ),
                      ),
                    ),)
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
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
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    //color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/fred.png"),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Fred Fafa",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "MontserratAlternates",
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "remyfafa12@gmail.com",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: "MontserratAlternates",
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Center(
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Center(
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
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
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    //color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/fred.png"),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Fred Fafa",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "MontserratAlternates",
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "remyfafa12@gmail.com",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: "MontserratAlternates",
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Center(
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Center(
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
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
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    //color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/fred.png"),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Fred Fafa",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "MontserratAlternates",
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "remyfafa12@gmail.com",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: "MontserratAlternates",
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Center(
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Center(
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
