import 'package:asocijacije/models/team.dart';
import 'package:flutter/material.dart';

class TeamTile extends StatelessWidget {
  final Team team;

  TeamTile({this.team});

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
                  'Tim ${team.id}',
                  style: TextStyle(
                    color: Color(0xffF3EFF5),
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              subtitle: Center(
                child: Text(
                  '${team.playerNames}',
                  style: TextStyle(
                    color: Color(0xffF3EFF5),
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
