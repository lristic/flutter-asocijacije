import 'package:animated_button/animated_button.dart';
import 'package:asocijacije/classes/SharedPref.dart';
import 'package:asocijacije/models/master.dart';
import 'package:asocijacije/models/mode.dart';
import 'package:asocijacije/models/words.dart';
import 'package:flutter/material.dart';

class ModeTile extends StatelessWidget {
  final Mode mode;
  Master master;
  SharedPref sharedPref = SharedPref();

  ModeTile({this.mode});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff190B28),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(3, 10, 0, 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Center(
                child: Text(
                  mode.modeName,
                  style: TextStyle(
                    color: Color(0xffF3EFF5),
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              subtitle: Center(
                child: Text(
                  '''
Normalna runda: ${mode.firstRound}s
Jedna reč runda: ${mode.secondRound}s
Pantomima runda: ${mode.thirdRound}s
                ''',
                  style: TextStyle(
                    color: Color(0xffF3EFF5),
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            AnimatedButton(
              width: 120,
              height: 50,
              child: Text(
                'IGRAJ',
                style: TextStyle(
                  color: Color(0xff190B28),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              color: Color(0xffFFCB47),
              onPressed: () async {
                master = Master.fromJson(await sharedPref.read("master"));
                master.modePlaying = mode.modeName == "Brzi" ? 1 : 2;
                sharedPref.save("master", master);

                Navigator.pushNamed(
                  context,
                  '/startGame',
                  arguments: {
                    "mode": mode.modeName == 'Brzi' ? 1 : 2,
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
