import 'package:animated_button/animated_button.dart';
import 'package:asocijacije/classes/SharedPref.dart';
import 'package:asocijacije/models/master.dart';
import 'package:asocijacije/models/team.dart';
import 'package:asocijacije/screens/game/fast_game.dart';
import 'package:asocijacije/screens/post_game/end_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

class ScoreOverview extends StatefulWidget {
  @override
  _ScoreOverviewState createState() => _ScoreOverviewState();
}

class _ScoreOverviewState extends State<ScoreOverview> {
  SharedPref sharedPref = SharedPref();

  List<int> scores = [];

  Master master;

  Future<List<int>> loadTeamScores() async {
    master = Master.fromJson(await sharedPref.read("master"));
    for (int i = 1; i <= master.numOfTeams; i++) {
      Team team = Team.fromJson(await sharedPref.read(i.toString()));
      scores.add(team.score);
    }
    return scores;
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Da li ste sigurni da želite da se vratite nazad?'),
            actions: <Widget>[
              Center(
                child: Text(
                  'Moraćete da počnete igru iz početka!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: AnimatedButton(
                  color: Color(0xffFFCB47),
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                  child: Text(
                    "Da",
                    style: TextStyle(
                      color: Color(0xff190B28),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: AnimatedButton(
                  color: Color(0xffFFCB47),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Ne",
                    style: TextStyle(
                      color: Color(0xff190B28),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Rezultat'),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            FutureBuilder<List<int>>(
              future: loadTeamScores(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Widget> children = List.generate(scores.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Tim ${index + 1} ima ',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            '${scores[index]} poena',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffFFCB47),
                            ),
                          ),
                        ],
                      ),
                    );
                  });

                  return Center(
                    child: Column(
                      children: children,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            AnimatedButton(
              width: 170,
              height: 60,
              color: Color(0xffFFCB47),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Dalje',
                  style: TextStyle(
                    color: Color(0xff190B28),
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onPressed: () {
                if (master.roundToPlay == 4) {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: EndGame(),
                      type: PageTransitionType.rightToLeft,
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FastGame(),
                      settings: RouteSettings(
                        arguments: arguments,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
