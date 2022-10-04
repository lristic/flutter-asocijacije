import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:asocijacije/models/team.dart';

class ChillGame extends StatefulWidget {
  @override
  _ChillGameState createState() => _ChillGameState();
}

class _ChillGameState extends State<ChillGame> {
  List<String> reci = [
    'Miš',
    'Tastatura',
    'Zagrada',
    'Ekran',
    'Laptop',
    'Dugme',
    'Slovo',
    'Broj',
    'Ranac',
    'Lampa',
    'Hemijska',
    'Marker',
    'Tanjir',
    'Viljuška',
    'Novčanik',
    'Majica',
    'Šorc',
    'Stolica',
    'Laser',
    'Poklopac',
    'Sto',
    'Fioka',
    'Čarape',
    'Slušalice',
    'Telefon',
    'Točkić',
    'Sveska',
    'Meso',
    'Kolač',
    'Kafa'
  ];

  int score = 0;
  final CountdownController controller = CountdownController();

  List<Widget> childrenTimerEnd = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chill mod - Normalna runda'),
        backgroundColor: Color(0xff46237A),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50.0),
            Text(
              'Igrac1 -> Igrac2',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Countdown(
                  seconds: 60,
                  build: (BuildContext context, double time) => Text(
                    time.toString(),
                    style: TextStyle(
                      fontSize: 80.0,
                    ),
                  ),
                  interval: Duration(milliseconds: 100),
                  onFinished: () {
                    setState(() {
                      childrenTimerEnd = List.generate(1, (index) {
                        return FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/normalRound');
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 5.0),
                            child: Text(
                              'Sledeći tim',
                              style: TextStyle(
                                color: Color(0xffFCFCFC),
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          color: Color(0xffff495c),
                        );
                      });
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 130.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  reci.last,
                  style: TextStyle(
                    fontSize: 50.0,
                  ),
                ),
                SizedBox(height: 30.0),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      reci.removeLast();
                      score = score + 1;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 5.0),
                    child: Text(
                      'Sledeća reč',
                      style: TextStyle(
                        color: Color(0xffFCFCFC),
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  color: Color(0xff80b918),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              children: childrenTimerEnd,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Poeni: $score',
                  style: TextStyle(fontSize: 30.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
