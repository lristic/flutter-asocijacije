import 'package:asocijacije/screens/choose_mode/choose_mode.dart';
import 'package:asocijacije/screens/game/fast_game.dart';
import 'package:asocijacije/screens/game/start_game.dart';
import 'package:asocijacije/screens/home/home.dart';
import 'package:asocijacije/screens/post_game/end_game.dart';
import 'package:asocijacije/screens/pre_game/create_teams.dart';
import 'package:asocijacije/screens/pre_game/player_names.dart';
import 'package:asocijacije/screens/pre_game/player_number.dart';
import 'package:asocijacije/screens/rules/rules.dart';
import 'package:asocijacije/screens/score_overview/score_overview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xff190B28),
            elevation: 7,
            centerTitle: true,
            toolbarHeight: 70.0,
          ),
          scaffoldBackgroundColor: Color(0xff6874E8),
          textTheme: TextTheme(
            bodyText1: TextStyle(
              color: Color(0xff190B28),
            ),
            bodyText2: TextStyle(
              color: Color(0xff190B28),
            ),
          )),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/chooseMode': (context) => ChooseMode(),
        '/playerNumber': (context) => PlayerNumber(),
        '/playerNames': (context) => PlayerNames(),
        '/createTeams': (context) => CreateTeams(),
        '/startGame': (context) => StartGame(),
        '/scoreOverview': (context) => ScoreOverview(),
        '/fastGame': (context) => FastGame(),
        '/endGame': (context) => EndGame(),
        '/rules': (context) => Rules(),
      },
    );
  }
}
