import 'dart:async';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:word_learn/core/models/learn_unit_model.dart';
import 'package:word_learn/utils/colors.dart';

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
      //backgroundColor: Colors.green[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        color: kTextColor.withOpacity(0.2),
                      )
                    ],
                    /* gradient: LinearGradient(
                      colors: [
                        Colors.purple[700],
                        Colors.yellow[800],
                      ],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(0.5, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp,
                    ), */
                    borderRadius: BorderRadius.circular(
                      25,
                    ),
                    border: Border.all(
                      width: 0.5,
                      color: Colors.orange.withOpacity(0.7),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(widget.lu.imageAsset),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
            child: Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                    icon: Icon(
                      Icons.chevron_right,
                      size: 50,
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context,
                          "/quizePage/${widget.lu.cat}/${widget.lu.index}");
                    }),
              ),
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
    /* Future.delayed(
      Duration(
        milliseconds: 50,
      ),
    ); */
    await player.stop();
    await player.play();
    await player.dispose();
  }
}
