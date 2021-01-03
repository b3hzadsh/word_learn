import 'dart:async';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:word_learn/core/models/learn_unit_model.dart';

class UnitLearnScreen extends StatefulWidget {
  final UnitLearn lu;

  const UnitLearnScreen({Key key, @required this.lu}) : super(key: key);

  @override
  _UnitLearnScreenState createState() => _UnitLearnScreenState();
}

class _UnitLearnScreenState extends State<UnitLearnScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 775), () {
      playSound(
        "assets/sounds/animals/" + widget.lu.soundName + ".mp3",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Image.asset(
                  "assets/images/animals/" + widget.lu.imageName + ".png"),
              /* decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/animals/" + widget.lu.imageName + ".png",
                  ),
                ),
              ), */
            ),
          )
        ],
      ),
    );
  }

  playSound(String sAsset) async {
    final player = AudioPlayer();
    // player.load();
    var _ = await player.setAsset(sAsset);

    await player.play();
    Future.delayed(
      Duration(
        milliseconds: 450,
      ),
    );
    await player.stop();
    await player.play();
    await player.dispose();
  }
}
