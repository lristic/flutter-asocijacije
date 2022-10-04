import 'dart:async';
import 'package:animated_button/animated_button.dart';
import 'package:asocijacije/classes/SharedPref.dart';
import 'package:asocijacije/models/master.dart';
import 'package:asocijacije/models/mode.dart';
import 'package:asocijacije/models/words.dart';
import 'package:asocijacije/screens/score_overview/score_overview.dart';
import 'package:flutter/material.dart';
import 'package:asocijacije/models/team.dart';
import 'package:page_transition/page_transition.dart';

class NormalRound extends StatefulWidget {
  @override
  _NormalRoundState createState() => _NormalRoundState();
}

class _NormalRoundState extends State<NormalRound> {
  @override
  void initState() {
    super.initState();
  }

  int score = 0;

  double _start = 30.0;
  Timer _timer;

  SharedPref sharedPref = SharedPref();

  Team currentTeam;
  Master master;
  int _pressed = 0;

  Future<Master> loadMaster() async {
    master = Master.fromJson(await sharedPref.read("master"));
  }

  Future<Team> loadTeam() async {
    await loadMaster();
    currentTeam =
        Team.fromJson(await sharedPref.read(master.teamToPlay.toString()));
    return currentTeam;
  }

  bool isVisible() {
    if (_start <= 0.0 || _start == 30) return false;
    return true;
  }

  bool arePlayersVisible() {
    if (_start <= 0.0) return false;
    return true;
  }

  bool isButtonVisible() {
    if (_pressed == 1) return false;
    return true;
  }

  bool isWordVisible() {
    if (_start <= 0.0) return false;
    return true;
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

  void startTimer() {
    _pressed = 1;
    const oneSec = const Duration(milliseconds: 100);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start <= 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start -= 0.1;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Normalna runda'),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30.0),
              Visibility(
                visible: arePlayersVisible(),
                child: Card(
                  color: Color(0xffA6AEF2),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FutureBuilder<Team>(
                      future: loadTeam(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data.playerExplaining == 1) {
                            return Visibility(
                              visible: arePlayersVisible(),
                              child: Text(
                                generatePadezi(1, snapshot),
                                // snapshot.data.player1 +
                                //     ' objašnjava ' +
                                //     snapshot.data.player2,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          } else {
                            return Visibility(
                              visible: arePlayersVisible(),
                              child: Text(
                                generatePadezi(2, snapshot),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          }
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Poeni u ovoj rundi:',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '$score',
                style: TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Visibility(
                      visible: isVisible(),
                      child: Card(
                        color: Color(0xffA6AEF2),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 30.0,
                          ),
                          child: Text(
                            allWords.last,
                            style: TextStyle(
                              fontSize: 50.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Visibility(
                      visible: isVisible(),
                      child: AnimatedButton(
                        width: 250,
                        height: 70,
                        onPressed: () {
                          setState(() {
                            //_audioCache.play("sounds/correct.mp3");
                            playedInNormal.add(allWords.last);
                            allWords.removeLast();
                            score = score + 1;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 5.0),
                          child: Text(
                            'Tačno!',
                            style: TextStyle(
                              color: Color(0xffFCFCFC),
                              fontSize: 30.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        color: Color(0xff32DE8A),
                      ),
                    ),
                    SizedBox(height: 30.0),
                  ],
                ),
              ),
              Column(
                children: [
                  Visibility(
                    visible: isVisible(),
                    child: Text(
                      _start.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.w600,
                        color: _start >= 10.0
                            ? Color(0xff190B28)
                            : Color(0xffFFCB47),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isButtonVisible(),
                    child: AnimatedButton(
                      color: Color(0xffFFCB47),
                      width: 250,
                      height: 70,
                      onPressed: () {
                        allWords.shuffle();
                        startTimer();
                      },
                      child: Text(
                        "Start",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff190B28),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_start <= 0)
                      AnimatedButton(
                        color: Color(0xffFFCB47),
                        width: 250,
                        height: 70,
                        onPressed: () {
                          currentTeam.score += score;
                          if (currentTeam.playerExplaining == 1) {
                            currentTeam.playerExplaining = 2;
                          } else {
                            currentTeam.playerExplaining = 1;
                          }
                          sharedPref.save(
                              master.teamToPlay.toString(), currentTeam);
                          if (master.teamToPlay != master.numOfTeams) {
                            master.teamToPlay += 1;
                          } else if (currentTeam.playerExplaining == 2) {
                            master.teamToPlay = 1;
                            master.roundToPlay = 1;
                          } else {
                            master.teamToPlay = 1;
                            master.roundToPlay = 2;
                          }

                          sharedPref.save("master", master);
                          Navigator.push(
                            context,
                            PageTransition(
                              child: ScoreOverview(),
                              type: PageTransitionType.rightToLeft,
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 5.0),
                          child: Text(
                            'Sledeći tim',
                            style: TextStyle(
                              color: Color(0xff190B28),
                              fontSize: 25.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String generatePadezi(playerExplaining, AsyncSnapshot<Team> snapshot) {
    if (playerExplaining == 1) {
      if (snapshot.data.player2.endsWith("a")) {
        return snapshot.data.player1 +
            " objašnjava " +
            snapshot.data.player2
                .substring(0, snapshot.data.player2.length - 1) +
            "i";
      } else if (snapshot.data.player2.endsWith("i")) {
        return snapshot.data.player1 +
            " objašnjava " +
            snapshot.data.player2
                .substring(0, snapshot.data.player2.length - 1) +
            "ju";
      } else if (snapshot.data.player2.endsWith("e")) {
        return snapshot.data.player1 +
            " objašnjava " +
            snapshot.data.player2
                .substring(0, snapshot.data.player2.length - 1) +
            "tu";
      } else if (snapshot.data.player2.endsWith("n")) {
        return snapshot.data.player1 +
            " objašnjava " +
            snapshot.data.player2
                .substring(0, snapshot.data.player2.length - 1) +
            "u";
      } else {
        return snapshot.data.player1 +
            " objašnjava " +
            snapshot.data.player2
                .substring(0, snapshot.data.player2.length - 2) +
            "ru";
      }
    } else {
      if (snapshot.data.player1.endsWith("a")) {
        return snapshot.data.player2 +
            " objašnjava " +
            snapshot.data.player1
                .substring(0, snapshot.data.player1.length - 1) +
            "i";
      } else if (snapshot.data.player1.endsWith("i")) {
        return snapshot.data.player2 +
            " objašnjava " +
            snapshot.data.player1
                .substring(0, snapshot.data.player1.length - 1) +
            "ju";
      } else if (snapshot.data.player1.endsWith("e")) {
        return snapshot.data.player2 +
            " objašnjava " +
            snapshot.data.player1
                .substring(0, snapshot.data.player1.length - 1) +
            "tu";
      } else if (snapshot.data.player1.endsWith("n")) {
        return snapshot.data.player2 +
            " objašnjava " +
            snapshot.data.player1
                .substring(0, snapshot.data.player1.length - 1) +
            "u";
      } else {
        return snapshot.data.player2 +
            " objašnjava " +
            snapshot.data.player1
                .substring(0, snapshot.data.player1.length - 2) +
            "ru";
      }
    }
  }
}

/*


*/