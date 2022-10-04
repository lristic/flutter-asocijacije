import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

class Rules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Uputstva',
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Normalna Runda',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Color(0xffE8F0FF),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'U brzom modu traje 30 sekundi, u chill modu traje 60 sekundi. Treba objasniti zadatu reč bez korišćenja iste ili korena iste.',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xffE8F0FF),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Jedna Reč Runda',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Color(0xffE8F0FF),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'U brzom modu traje 30 sekundi, u chill modu traje 60 sekundi. Treba objasniti zadatu reč korišćenjem samo jedne reči koja je slična zadatoj, ili koja će asocirati na zadatu.',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xffE8F0FF),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Pantomima runda',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Color(0xffE8F0FF),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'U brzom modu traje 60 sekundi, u chill modu traje 90 sekundi. Treba objasniti zadatu reč pantomimom.',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xffE8F0FF),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Rezultat se sabira kroz runde, tim sa najviše poena je pobednički.',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xffE8F0FF),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            AnimatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Nazad',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              width: 250,
              height: 70,
              color: Color(0xffFFCB47),
            )
          ],
        ),
      ),
    );
  }
}
