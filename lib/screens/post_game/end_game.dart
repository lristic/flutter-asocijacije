import 'package:animated_button/animated_button.dart';
import 'package:asocijacije/classes/SharedPref.dart';
import 'package:asocijacije/models/master.dart';
import 'package:asocijacije/models/team.dart';
import 'package:asocijacije/models/words.dart';
import 'package:flutter/material.dart';

class EndGame extends StatefulWidget {
  @override
  _EndGameState createState() => _EndGameState();
}

class _EndGameState extends State<EndGame> {
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
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Kraj igre'),
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
                      child: Text(
                        'Tim ${index + 1} ima ${scores[index]} poena',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
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
              height: 20,
            ),
            AnimatedButton(
              color: Color(0xffFFCB47),
              width: 170,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Nova Igra',
                  style: TextStyle(
                    color: Color(0xff190B28),
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
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
