import 'package:animated_button/animated_button.dart';
import 'package:asocijacije/models/mode.dart';
import 'package:asocijacije/models/team.dart';
import 'package:asocijacije/tiles/mode_tile.dart';
import 'package:flutter/material.dart';

class ChooseMode extends StatefulWidget {
  @override
  _ChooseModeState createState() => _ChooseModeState();
}

class _ChooseModeState extends State<ChooseMode> {
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
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                  child: Text(
                    "Da",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: AnimatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Ne",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
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
          title: Text('Izaberite mod igre'),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            ModeTile(
              mode: Mode(
                firstRound: 30,
                secondRound: 30,
                thirdRound: 60,
                modeName: 'Brzi',
              ),
            ),
            SizedBox(height: 10),
            ModeTile(
              mode: Mode(
                firstRound: 60,
                secondRound: 60,
                thirdRound: 90,
                modeName: 'Chill',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
