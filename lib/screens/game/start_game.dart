import 'package:asocijacije/screens/game/chill_game.dart';
import 'package:asocijacije/screens/game/fast_game.dart';
import 'package:flutter/material.dart';

class StartGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    print(arguments.toString());
    if (arguments["mode"].toString() == "1") {
      return FastGame();
    } else {
      return ChillGame();
    }
  }
}
