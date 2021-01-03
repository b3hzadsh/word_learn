import 'package:flutter/material.dart';
import 'package:word_learn/ui/widgets/widgets.dart';

class ChooseCat extends StatelessWidget {
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
                    "/learnPage/animals"), // a number after category to determin last learnt word
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
