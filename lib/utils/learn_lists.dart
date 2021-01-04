List<String> animals = [
  // 0
  "bat",
  "bear",
  "caty",
  "chicken",
  "cow",
  "crab",
  "dog",
  "donkey",
  "elephant",
  "fish",
  "fox",
  "gooril",
  "horse",
  "lion",
  "monkey",
  "panda",
  "rabbit",
  "seahorse",
  "seal",
  "shark",
  "sheep",
  "snake",
  "sparrow",
  "spider",
  "tiger",
  "wolf",
  "zebra",
];
List<String> colors = [
  // 1
  "black",
  "blue",
  "brown",
  "green",
  "orange",
  "pink",
  "red",
  "silver",
  "violet",
  "white",
  "yellow",
];
/* 
Map listToNum = {
  "animals": 1,
  "colors": 2,

  //
  "1": animals.length,
  "2": colors.length,
}; */
int getLength(String cat) {
  switch (cat) {
    case "animals":
      return animals.length;

      break;
    case "colors":
      return colors.length;

      break;
    default:
  }
  return 0;
}
