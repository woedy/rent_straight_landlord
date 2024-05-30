import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_straight_landlord/Auth/SignUp/select_user_type.dart';
import 'package:rent_straight_landlord/Auth/SignUp/subscription.dart';
import 'package:rent_straight_landlord/Auth/SignUp/subscription_card.dart';
import 'package:rent_straight_landlord/HomeScreen/home_screen.dart';
import 'package:rent_straight_landlord/LandloardProfile/landloard_profile.dart';
import 'package:rent_straight_landlord/SplashScreen/splash_screen.dart';
import 'package:rent_straight_landlord/theme.dart';
import 'Accepting/accepting1.dart';
import 'HomeScreen/house_detail.dart';
import 'constants.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => {runApp(MyApp())});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Hide the keyboard when tapping outside the text field
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rent Straight-Landlord',
        theme: theme(),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? api_key = "";
  Future? _user_api;

  @override
  void initState() {
    super.initState();
    _user_api = apiKey();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _user_api,
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          //return api_key == null ? SplashScreen() : HomeScreen();
          //return SplashScreen();
          //return SubscriptionCard(full_name: "Deladem Pingship",);
          return SplashScreen();

        });
  }

  Future apiKey() async {
    api_key = await getApiPref();
  }
}
