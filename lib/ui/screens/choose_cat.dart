import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:word_learn/ui/widgets/widgets.dart';
import 'package:word_learn/utils/sharedprefs.dart';

class ChooseCat extends StatefulWidget {
  @override
  _ChooseCatState createState() => _ChooseCatState();
}

class _ChooseCatState extends State<ChooseCat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("انتخاب "),),
      body: Center(
        child: Wrap(
          children: [
            MyWidgets.imageButton(
                context: context,
                imageAsset: "assets/images/animals/sheep.png",
                title: "حیوانات",
                routeNmae:
                    "/learnPage/animals/${sharedPrefs.animal}"), // a number after category to determin last learnt word
            MyWidgets.imageButton(
                context: context,
                imageAsset: "assets/images/colors.jpg",
                title: "حیوانات",
                routeNmae: "/learnPage/colors/${sharedPrefs.color}"),
            MyWidgets.imageButton(
              context: context,
              imageAsset: "assets/images/animals/bear.png",
              title: "حیوانات",
            ),
            MyWidgets.imageButton(
              context: context,
              imageAsset: "assets/images/animals/bear.png",
              title: "حیوانات",
            ),
          ],
        ),
      ),
    );
  }
}
