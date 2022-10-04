import 'package:asocijacije/models/master.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_button/animated_button.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';

class PlayerNumber extends StatefulWidget {
  @override
  _PlayerNumberState createState() => _PlayerNumberState();
}

class _PlayerNumberState extends State<PlayerNumber> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController formController = TextEditingController();
  String dropdownValue = '4';
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
    final data = ModalRoute.of(context).settings.arguments;
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Asocijacije',
              style: TextStyle(
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            automaticallyImplyLeading: false,
            toolbarHeight: 70.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(7),
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Izaberite broj igrača',
                  style: TextStyle(
                    fontSize: 32.0,
                    color: Color(0xff190B28),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  child: //Form(
                      //   key: _formKey,
                      //   child: TextFormField(
                      //     decoration: InputDecoration(
                      //       errorStyle: TextStyle(
                      //         fontWeight: FontWeight.w700,
                      //         fontSize: 14,
                      //       ),
                      //       enabledBorder: UnderlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: Color(0xff0D0A0B),
                      //         ),
                      //       ),
                      //       focusedBorder: UnderlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //       border: UnderlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: Color(0xff2E282A),
                      //         ),
                      //       ),
                      //     ),
                      //     cursorColor: Colors.white,
                      //     validator: (val) => (val.isEmpty ||
                      //             int.parse(val) < 4 ||
                      //             int.parse(val) % 2 != 0)
                      //         ? 'Unesite broj igrača (više od 3 i paran)'
                      //         : null,
                      //     controller: formController,
                      //     keyboardType: TextInputType.number,
                      //     textAlign: TextAlign.center,
                      //     style: TextStyle(
                      //       fontSize: 30.0,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
                      Container(
                    height: 60,
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      iconSize: 35,
                      iconEnabledColor: Color(0xff190B28),
                      isExpanded: true,
                      elevation: 100,
                      style: const TextStyle(color: Color(0xff190B28)),
                      underline: Container(
                        height: 1,
                        color: Color(0xff190B28),
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['4', '6', '8', '10', '12']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Center(
                            child: Text(value,
                                style: TextStyle(
                                  fontSize: 25,
                                )),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                AnimatedButton(
                  child: Text(
                    'Dalje',
                    style: TextStyle(
                      color: Color(0xff0D0A0B),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    // if (_formKey.currentState.validate()) {
                    Navigator.pushNamed(context, '/playerNames',
                        arguments: dropdownValue); //formController.text
                    // }
                  },
                  width: 150,
                  height: 60,
                  color: Color(0xffFFCB47),
                  shadowDegree: ShadowDegree.light,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
