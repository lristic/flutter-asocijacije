import 'dart:io';

import 'package:asocijacije/screens/pre_game/player_number.dart';
import 'package:asocijacije/screens/rules/rules.dart';
import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_background/animated_background.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title:
                new Text('Da li ste sigurni da želite izađete iz aplikacije?'),
            actions: <Widget>[
              Center(
                child: AnimatedButton(
                  color: Color(0xffFFCB47),
                  onPressed: () {
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
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
        backgroundColor: Color(0xff6874E8),
        body: AnimatedBackground(
          vsync: this,
          behaviour: RandomParticleBehaviour(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Asocijacije',
                  style: TextStyle(
                    fontSize: 50,
                    color: Color(0xff0D0A0B),
                  ),
                ),
                SizedBox(height: 50),
                AnimatedButton(
                  duration: 30,
                  enabled: true,
                  shadowDegree: ShadowDegree.dark,
                  child: Text(
                    'Start',
                    style: TextStyle(
                      color: Color(0xff190B28),
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  width: 280,
                  height: 100,
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: PlayerNumber(),
                        type: PageTransitionType.rightToLeft,
                      ),
                    );
                  },
                  color: Color(0xffFFCB47),
                ),
                SizedBox(
                  height: 30,
                ),
                AnimatedButton(
                  duration: 30,
                  enabled: true,
                  shadowDegree: ShadowDegree.light,
                  child: Text(
                    'Uputstva',
                    style: TextStyle(
                      color: Color(0xff190B28),
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  width: 280,
                  height: 100,
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: Rules(),
                        type: PageTransitionType.rightToLeft,
                      ),
                    );
                  },
                  color: Color(0xffFFCB47),
                ),
                SizedBox(
                  height: 30,
                ),
                AnimatedButton(
                  duration: 30,
                  enabled: true,
                  shadowDegree: ShadowDegree.dark,
                  child: Text(
                    'Izlaz',
                    style: TextStyle(
                      color: Color(0xff190B28),
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  width: 280,
                  height: 100,
                  onPressed: () {
                    _onBackPressed();
                  },
                  color: Color(0xffFFCB47),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
