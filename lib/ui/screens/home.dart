import 'package:flutter/material.dart';
import 'package:word_learn/ui/widgets/widgets.dart';
import 'package:word_learn/utils/colors.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      //backgroundColor: Color(0xff09142A),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Main Screen",
          style: TextStyle(color: kPrimeryColor),
          //style: TextStyle(fontFamily: "Helvetica"),
        ),
      ),
      body: Center(
        child: Container(
          // margin: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyWidgets.myButton(
                  width: width,
                  title: "Start to learn",
                  context: context,
                  routeName: "/screen/choose-cat"),
              MyWidgets.myButton(
                  width: width,
                  title: "About",
                  context: context,
                  routeName: "/screen/about"),
              MyWidgets.myButton(
                  width: width,
                  title: "Setting",
                  context: context,
                  routeName: "/screen/setting"),
              MyWidgets.myButton(
                  width: width,
                  title: "Exit",
                  context: context,
                  routeName: "exit"),
            ],
          ),
        ),
      ),
    );
  }
}
