import 'package:asocijacije/classes/SharedPref.dart';
import 'package:asocijacije/models/master.dart';
import 'package:asocijacije/screens/rounds/normal_round.dart';
import 'package:asocijacije/screens/rounds/oneword_round.dart';
import 'package:asocijacije/screens/rounds/pantomime_round.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:asocijacije/models/team.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FastGame extends StatefulWidget {
  @override
  _FastGameState createState() => _FastGameState();
}

class _FastGameState extends State<FastGame> {
  SharedPref sharedPref = SharedPref();
  Master master;

  Future<Master> loadMaster() async {
    master = Master.fromJson(await sharedPref.read("master"));
    return master;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Master>(
      future: loadMaster(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.roundToPlay == 1) {
            return NormalRound();
          } else if (snapshot.data.roundToPlay == 2) {
            return OneWordRound();
          } else {
            return PantomimeRound();
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
