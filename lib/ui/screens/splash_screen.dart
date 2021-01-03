import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, "/screen/home");
      },
    );
    //after 3 sec , will go to home screen
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: Image.asset(
        "assets/images/hi-splash.gif",
        height: (deviceWidth > deviceHeight)
            ? deviceHeight / 1.5
            : deviceWidth / 1.5,
      ),
      //show a gif for wellcome
    );
  }
}
