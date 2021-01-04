import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:word_learn/core/models/learn_unit_model.dart';
import 'package:word_learn/ui/widgets/widgets.dart';
import 'package:word_learn/utils/learn_lists.dart';

class QuizeScreen extends StatefulWidget {
  /* final String category;
  final int index; */
  final UnitLearn lu;
  const QuizeScreen({Key key, /*  this.category, this.index ,*/ this.lu})
      : super(key: key);

  @override
  _QuizeScreenState createState() => _QuizeScreenState();
}

class _QuizeScreenState extends State<QuizeScreen> {
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
    var myIdex = moreIndex(widget.lu.index, getLength(widget.lu.cat));
    List shuffleWidget = <Widget>[
      /* MyWidgets.wrongAnswerWidget(index, category, context),
      MyWidgets.wrongAnswerWidget(index, category, context),
      MyWidgets.wrongAnswerWidget(index, category, context), */
      MyWidgets.correctAnswerWidget(myIdex[0], widget.lu.cat, context),
      MyWidgets.correctAnswerWidget(myIdex[1], widget.lu.cat, context),
      MyWidgets.correctAnswerWidget(myIdex[2], widget.lu.cat, context),
      MyWidgets.correctAnswerWidget(widget.lu.index, widget.lu.cat, context),
    ];
    shuffleWidget.shuffle();
    return Scaffold(
      appBar: AppBar(
        title: Text("Quize"),
        actions: [
          FlatButton(
            onPressed: () {
              playSound(widget.lu.soundAsset);
            },
            child: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        child: Center(
          child: Wrap(
            runSpacing: 20,
            spacing: 15,
            children: shuffleWidget,
          ),
        ),
      ),
    );
  }

  List<int> moreIndex(int index, int length) {
    List<int> wrongIndexes = [
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0
    ];
    for (int i = 0; i < length - 1; i++) wrongIndexes[i] = i;
    wrongIndexes.remove(index);
    wrongIndexes.remove(0);
    wrongIndexes.shuffle();
    return wrongIndexes;
  }

  playSound(String sAsset) async {
    final player = AudioPlayer(); //animal
    final pl = AudioPlayer();
    await player.setAsset(sAsset);
    await pl.setAsset("assets/sounds/shortChoose.mp3");
    await player.play();
    await player.stop();
    /* Timer(
        Duration(
          milliseconds: 1150,
        ),
        () async {}); */
    // player.stop();
    await pl.play();
    await player.dispose();
    await pl.dispose();
  }
}
