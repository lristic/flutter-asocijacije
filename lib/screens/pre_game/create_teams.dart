import 'package:animated_button/animated_button.dart';
import 'package:asocijacije/classes/SharedPref.dart';
import 'package:asocijacije/models/master.dart';
import 'package:asocijacije/models/mode.dart';
import 'package:asocijacije/models/team.dart';
import 'package:asocijacije/screens/choose_mode/choose_mode.dart';
import 'package:asocijacije/tiles/team_tile.dart';
import 'package:flutter/material.dart';
import 'package:asocijacije/models/team.dart';
import 'package:page_transition/page_transition.dart';

class CreateTeams extends StatefulWidget {
  @override
  _CreateTeamsState createState() => _CreateTeamsState();
}

class _CreateTeamsState extends State<CreateTeams> {
  @override
  Widget build(BuildContext context) {
    Mode mode;
    List<Team> data = ModalRoute.of(context).settings.arguments;

    print(data);
    List<Widget> children = List.generate(data.length, (index) {
      return TeamTile(
        team: Team(
          player1: data[index].player1,
          player2: data[index].player2,
          score: data[index].score,
          id: index + 1,
          playerExplaining: 1,
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Timovi"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 100.0,
          horizontal: 5.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
            SizedBox(height: 20.0),
            AnimatedButton(
              width: 150,
              height: 60,
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: ChooseMode(),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
              color: Color(0xffFFCB47),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Počni igru',
                  style: TextStyle(
                    color: Color(0xff190B28),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
