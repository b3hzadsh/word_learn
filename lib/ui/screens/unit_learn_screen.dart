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
    Timer(Duration(milliseconds: 375), () {
      playSound(
        widget.lu.soundAsset,
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
              child: Image.asset(widget.lu.imageAsset),
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
