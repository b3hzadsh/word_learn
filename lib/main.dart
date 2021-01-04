import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_learn/ui/screens/provider.dart';
import 'package:word_learn/utils/colors.dart';
import 'core/models/learn_unit_model.dart';
import 'ui/screens/choose_cat.dart';
import 'ui/screens/home.dart';
import 'ui/screens/quiz_screen.dart';
import 'ui/screens/splash_screen.dart';
import 'ui/screens/unit_learn_screen.dart';

void main() {
  runApp(
    MultiProvider(
      child: MyApp(),
      providers: [
        ChangeNotifierProvider(
          create: (_) => Counter(),
        ),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "MinionPro",
        scaffoldBackgroundColor: Color(0xff09142A),
        appBarTheme: AppBarTheme(
          elevation: 3.0,
          color: Color(0xff09142A),
        ),
        primaryColor: kPrimeryColor,
        textTheme: Theme.of(context)
            .textTheme
            .apply(bodyColor: kPrimeryColor, fontFamily: "MinionPro"),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: "words app",
      onGenerateRoute: (RouteSettings setting) {
        var splitedRoute = setting.name.split("/");
        // create some route for every page and pushed named
        if (setting.name == "/") // for home
          return MaterialPageRoute(
            builder: (context) => SplashScreen(),

            //  ProviderInt(),
            // bring splash screen at startup
          );
        if (setting.name == "/screen/choose-cat") // for home
          return MaterialPageRoute(
            builder: (context) => ChooseCat(),
            // bring choosing cat screen to user
          );
        if (setting.name == "/screen/home") // for home
          return MaterialPageRoute(
            builder: (context) => Home(),
            // bring home
          );
        if (setting.name == "/learnPage/animals") // for home
          return MaterialPageRoute(
            builder: (context) => UnitLearnScreen(
              lu: UnitLearn.name(
                cat: "animals",
                name: "sheep",
              ),
            ),
            // bring home
          );
        /* QuizeScreen(
              lu: UnitLearn.index(cat: "animals", index: 2),
            ), */
        //"/quizePage/${widget.lu.cat}/${widget.lu.index}"
        if (splitedRoute[1] == "quizePage") {
          //setting.name.substring(1, 10)
          //var temp = setting.name.split("/");
          print(splitedRoute[2]);
          return MaterialPageRoute(
            builder: (context) => QuizeScreen(
              lu: UnitLearn.index(
                cat: splitedRoute[2],
                index: int.tryParse(splitedRoute[3]),
              ),
            ),
            // bring home
          );
        } // for home
      },
    );
  }
}
