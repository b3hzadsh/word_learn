import 'dart:async';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:just_audio/just_audio.dart' show AudioPlayer;
import 'package:word_learn/utils/colors.dart';

class MyWidgets {
  static Widget myButton(
      {String title, BuildContext context, String routeName, double width}) {
    return ArgonButton(
      height: MediaQuery.of(context).size.height * 7 / 100,
      roundLoadingShape: true,
      width: MediaQuery.of(context).size.width * 0.65,
      onTap: (startLoading, stopLoading, btnState) async {
        final player = AudioPlayer();
        // player.load();
        var _ = await player.setAsset('assets/sounds/bsh.mp3');
        await player.play();
        if (btnState == ButtonState.Idle) {
          startLoading();
          if (routeName == "exit") {
            SystemNavigator.pop();
          }
          Timer(
              Duration(
                milliseconds: 700,
              ), () {
            Navigator.of(context).pushNamed(routeName);

            stopLoading();
          });
        } else {
          stopLoading();
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -2),
              blurRadius: 2,
              color: kTextColor.withOpacity(0.2),
            )
          ],
          gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black12,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(0.5, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Center(
          child: Text(
            "$title",
            style: TextStyle(
                color: kTextColor,
                fontSize: width / 15,
                fontWeight: FontWeight.w700,
                fontFamily: "Ubuntu"),
          ),
        ),
      ),
      loader: Container(
        padding: EdgeInsets.all(10),
        child: SpinKitRotatingCircle(
          color: Colors.white,
          // size: loaderWidth ,
        ),
      ),
      borderRadius: width * 4 / 100,
      color: kPrimeryColor,
    );
  }

  static Widget myButon(
      {BuildContext context, String title, String routeNmae}) {
    return GestureDetector(
      onTap: () {
        if (routeNmae != "exit") {
          Navigator.pushNamed(context, routeNmae);
        } else
          SystemNavigator.pop();
      },
      child: Container(
        //TODO scale stuff
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 20,
              color: kTextColor.withOpacity(0.45),
            )
          ],
          gradient: LinearGradient(
              colors: [
                Color(0xffACBB78),
                Color(0xff799F0C),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.5, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  static Widget imageButton(
      {BuildContext context,
      String title,
      String imageAsset,
      String routeNmae}) {
    return GestureDetector(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.width / 2.5,
            width: MediaQuery.of(context).size.width / 2.5,
            //padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              //color: kBackgroindColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: kTextColor.withOpacity(0.36),
                  offset: Offset(0, 8),
                )
              ],
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(
                  imageAsset,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                // color: kPrimeryColor,
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: [
                  Colors.transparent,
                  Colors.black38,
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      onTap: () {
        if (routeNmae != null) {
          Navigator.pushNamed(context, routeNmae);
        }
      },
    );
  }
}
