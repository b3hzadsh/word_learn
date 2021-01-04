import 'package:flutter/foundation.dart';
import 'package:word_learn/utils/learn_lists.dart';

class UnitLearn {
  String name;
  final String cat;
  int index;
  String imageAsset;
  String soundAsset;
  UnitLearn.name({@required this.name, @required this.cat}) {
    this.imageAsset = "assets/images/$cat/" + name + ".png";
    this.soundAsset = "assets/sounds/$cat/" + name + ".mp3";
    List temp = findlist(cat);
    index = temp.indexOf(name);
  }
  UnitLearn.index({@required this.index, @required this.cat}) {
    String imageName;
    switch (cat) {
      case "animals":
        imageName = animals[index];

        break;
      case "colors":
        imageName = colors[index];

        break;
      default:
    }
    this.imageAsset = "assets/images/$cat/" + imageName + ".png";
    this.soundAsset = "assets/sounds/$cat/" + imageName + ".mp3";
  }
}
