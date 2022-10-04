import 'package:animated_button/animated_button.dart';
import 'package:asocijacije/classes/SharedPref.dart';
import 'package:asocijacije/models/master.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:asocijacije/models/team.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<TextEditingController> formControllers = [];

class PlayerNames extends StatelessWidget {
  /* move focus from one text field to next one */
  final FocusScopeNode _node = FocusScopeNode();
  @override
  void dispose() {
    _node.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context).settings.arguments;
    int players = int.parse(data);
    int team_id = 0;

    List<GlobalKey<FormState>> formKeys = [];

    List<String> controllerVals = [];
    List<Team> teams = [];

    SharedPref sharedPref = SharedPref();

    for (var i = 0; i < players; i++) {
      formKeys.add(GlobalKey<FormState>());
      formControllers.add(TextEditingController());
    }

    List<Widget> children = List.generate(players, (index) {
      return Form(
        key: formKeys[index],
        child: FocusScope(
          node: _node,
          child: Column(
            children: <Widget>[
              index % 2 == 0
                  ? Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Tim ${++team_id}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    )
                  : Text(''),
              SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 50.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Igrač ${index + 1}',
                    hintStyle: TextStyle(
                      color: Color(0xffFFCB47).withOpacity(0.8),
                    ),
                    errorStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff0D0A0B),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffFFCB47),
                      ),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffFFCB47),
                      ),
                    ),
                  ),
                  cursorColor: Color(0xffFFCB47),
                  controller: formControllers[index],
                  textInputAction: TextInputAction.next,
                  onEditingComplete: _node.nextFocus,
                  validator: (val) => val.isEmpty ? 'Unesite ime igrača' : null,
                  style: TextStyle(
                    color: Color(0xffFFCB47),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });

    List<String> getControllerVals() {
      for (var i = 0; i < formControllers.length; i++) {
        controllerVals.add(formControllers[i].text);
      }
      return controllerVals;
    }

    bool isOk() {
      for (var i = 0; i < players; i++) {
        if (!formKeys[i].currentState.validate()) {
          return false;
        }
      }

      return true;
    }

    Future<bool> _onBackPressed() {
      return showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title:
                  new Text('Da li ste sigurni da želite da se vratite nazad?'),
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

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Imena igrača'),
            automaticallyImplyLeading: false,
          ),
          body: ListView(
            shrinkWrap: true,
            children: <Widget>[
              SizedBox(height: 20.0),
              Column(
                children: children,
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: AnimatedButton(
                  onPressed: () {
                    if (isOk()) {
                      for (var i = 0, j = 0, k = 1; i < players; i++) {
                        if (i % 2 == 0) {
                          teams.add(Team(
                              player1: formControllers[i].text,
                              player2: formControllers[i + 1].text,
                              score: 0,
                              id: k));
                          sharedPref.save(k.toString(), teams[j++]);
                          k++;
                        }
                      }

                      Master master = Master();
                      master.numOfTeams = teams.length;

                      sharedPref.save("master", master);

                      print("Master u player names je " + master.toString());

                      Navigator.pushNamed(context, '/createTeams',
                          arguments: teams);
                    }
                  },
                  child: Text(
                    'Dalje',
                    style: TextStyle(
                      color: Color(0xff190B28),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  width: 150,
                  height: 60,
                  color: Color(0xffFFCB47),
                  shadowDegree: ShadowDegree.light,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
