import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_straight_landlord/ChatScreen/chat_screen.dart';
import 'package:rent_straight_landlord/HouseInner/house_inner_1.dart';
import 'package:rent_straight_landlord/LandloardProfile/landloard_profile.dart';
import 'package:rent_straight_landlord/UploadHouse/upload_house_1.dart';
import 'package:rent_straight_landlord/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
                  Container(
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
                      child: Image.asset("assets/images/jam_menu.png")),
                 

                  InkWell(
                    onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LandlordProfile()));

                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage("assets/images/fred.png")
                        )

                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),

              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w600, height: 1.2, color: Colors.grey.withOpacity(0.5)),),
                      Row(
                        children: [
                          Text("Fred, Find the best ", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w600, height: 1.2, ),),
                          Text("Rental Home Here", style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w600, height: 1.2, color: rentPrimary),),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 160,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.all(10),
                          width: 250,
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage("assets/images/total_prop.png"),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Total Properties", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w600, height: 1.2, ),),

                                    ],
                                  ),
                                  Container(

                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("13", style: TextStyle(fontSize: 36, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w600, height: 1.2, ),),
                                            Row(
                                              children: [
                                                Text("+2%", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w600, height: 1.2, ),),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("last month", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w600, height: 1.2, color: Colors.grey ),),
                                              ],
                                            ),

                                          ],
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Image(image: AssetImage("assets/images/graph1.png"))
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          width: 250,
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage("assets/images/total_prop.png"),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Total Properties", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w600, height: 1.2, ),),

                                    ],
                                  ),
                                  Container(

                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("13", style: TextStyle(fontSize: 36, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w600, height: 1.2, ),),
                                            Row(
                                              children: [
                                                Text("+2%", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w600, height: 1.2, ),),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("last month", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w600, height: 1.2, color: Colors.grey ),),
                                              ],
                                            ),

                                          ],
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Image(image: AssetImage("assets/images/graph1.png"))
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
              SizedBox(
                height: 15,
              ),

              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildNavItem2("assets/images/streamline_cards.png", 0, ),
                        buildNavItem2("assets/images/mdi_cards-variant.png", 1, ),
                        buildNavItem2("assets/images/cil_list.png", 2, ),

                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: PageView(

                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            currentPage = page;
                          });
                        },
                        children: [
                          _houses_page(),
                          _houses_scroll(),
                          _houses_list()
                          // Add more pages as needed
                        ],
                      ),
                    ),
                  ],
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


  Widget buildNavItem2(String image, int pageIndex) {
    bool isSelected = currentPage == pageIndex;

    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          pageIndex,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? rentPrimary : null,
          borderRadius: BorderRadius.circular(15),
        ),
        child:Image.asset(image, color: isSelected ? Colors.white : Colors.black,),
      ),
    );
  }

  Widget _houses_page (){
    return ListView.builder(

      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index){
        return Container(
          margin: EdgeInsets.only(right: 10),
          child:    InkWell(
            onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HouseInner1()));

            },
            child: Container(
              //color: Colors.red,
                height: 350,
                width: MediaQuery.of(context).size.width - 30,
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
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.favorite, color: Colors.white,)
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
                                      )
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("St.Patrick Estate", style: TextStyle(fontSize: 20, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.white),),
                                                Text("Ritz, Adenta | 3.5Km away", style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.white),),
                                              ],
                                            ),
                                            Container(
                                              width: 80,
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: Colors.green.withOpacity(0.5),
                                                  borderRadius: BorderRadius.circular(20)
                                              ),
                                              child: Center(child: Text("Available", style: TextStyle(fontSize: 10, fontFamily: "MontserratAlternates", color: Colors.green),)),

                                            )
                                          ],
                                        ),
                                      ),


                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.bed,color: Colors.white, size: 30,),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text("3", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.white),),

                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.food_bank,color: Colors.white, size: 30,),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text("1", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.white),),

                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.bathtub_rounded,color: Colors.white, size: 30,),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text("3", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.white),),

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
                          )
                        ],
                      ),
                    ),
                  ],
                )
            ),
          ),
        );
      }

    );
  }
  Widget _houses_scroll (){
    return ListView.builder(

        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index){
          return Container(
            margin: EdgeInsets.only(bottom: 10),
            child:    InkWell(
              onTap: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context) => HouseInner1()));

              },
              child: Container(
                //color: Colors.red,
                  height: 350,
                  width: MediaQuery.of(context).size.width - 30,
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
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(Icons.favorite, color: Colors.white,)
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
                                        )
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("St.Patrick Estate", style: TextStyle(fontSize: 20, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.white),),
                                                  Text("Ritz, Adenta | 3.5Km away", style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.white),),
                                                ],
                                              ),
                                              Container(
                                                width: 80,
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    color: Colors.green.withOpacity(0.5),
                                                    borderRadius: BorderRadius.circular(20)
                                                ),
                                                child: Center(child: Text("Available", style: TextStyle(fontSize: 10, fontFamily: "MontserratAlternates", color: Colors.green),)),

                                              )
                                            ],
                                          ),
                                        ),


                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.bed,color: Colors.white, size: 30,),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text("3", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.white),),

                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.food_bank,color: Colors.white, size: 30,),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text("1", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.white),),

                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.bathtub_rounded,color: Colors.white, size: 30,),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text("3", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.white),),

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
                            )
                          ],
                        ),
                      ),
                    ],
                  )
              ),
            ),
          );
        }

    );
  }

  Widget _houses_list (){
    return ListView(
      children: [

        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
            child: InkWell(
              onTap: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context) => HouseInner1()));

              },
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
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(child: Text("Available", style: TextStyle(fontSize: 10, fontFamily: "MontserratAlternates", color: Colors.green),)),

                        ),
                        SizedBox(
                          height: 10,
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
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          child: InkWell(
            onTap: (){
              //Navigator.push(context, MaterialPageRoute(builder: (context) => HouseInner1()));

            },
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
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(child: Text("Available", style: TextStyle(fontSize: 10, fontFamily: "MontserratAlternates", color: Colors.green),)),

                      ),
                      SizedBox(
                        height: 10,
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
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          child: InkWell(
            onTap: (){
             // Navigator.push(context, MaterialPageRoute(builder: (context) => HouseInner1()));

            },
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
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(child: Text("Available", style: TextStyle(fontSize: 10, fontFamily: "MontserratAlternates", color: Colors.green),)),

                      ),
                      SizedBox(
                        height: 10,
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
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          child: InkWell(
            onTap: (){
              //Navigator.push(context, MaterialPageRoute(builder: (context) => HouseInner1()));

            },
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
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(child: Text("Available", style: TextStyle(fontSize: 10, fontFamily: "MontserratAlternates", color: Colors.green),)),

                      ),
                      SizedBox(
                        height: 10,
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
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          child: InkWell(
            onTap: (){
             // Navigator.push(context, MaterialPageRoute(builder: (context) => HouseInner1()));

            },
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
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(child: Text("Available", style: TextStyle(fontSize: 10, fontFamily: "MontserratAlternates", color: Colors.green),)),

                      ),
                      SizedBox(
                        height: 10,
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
        ),
      ],
    );
  }


}
