import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final number = Random().nextInt(10);
    final score = 0;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: firstPage(number: number, score: score),
    );
  }
}

class firstPage extends StatelessWidget {
  const firstPage({
    Key? key,
    required this.number,
    required this.score,
  }) : super(key: key);

  final int number;
  final int score;

  @override
  Widget build(BuildContext context) {
    int score2 = 0;
    int number2 = Random().nextInt(10);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
              number2.toString(),
              style: GoogleFonts.robotoCondensed(
                fontSize: 180,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Następna liczba będzie...',
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoCondensed(
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => Higher(
                              number: number2, score: score2, flag: true)),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Wyższa',
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => Higher(
                              number: number, score: score, flag: false)),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Niższa',
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Higher extends StatelessWidget {
  const Higher({
    Key? key,
    required this.number,
    required this.score,
    required this.flag,
  }) : super(key: key);

  final int number;
  final int score;
  final bool flag;

  @override
  Widget build(BuildContext context) {
    int number2 = Random().nextInt(10);
    int newScore = score;
    if (number == number2) {
      bool swap = Random().nextBool();
      if (swap) {
        number2 += 1;
      } else {
        number2 -= 1;
      }
    }
    var flag2 = false;
    if (flag) {
      if (number <= number2) {
        newScore += 1;
        flag2 = true;
      } else
        flag2 = false;
    } else {
      if (number >= number2) {
        newScore += 1;
        flag2 = false;
      } else
        flag2 = true;
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Text('last: ' + number.toString()),
            if (flag2 != flag)
              Text(
                'Niestety przegrałeś... ',
                style: GoogleFonts.robotoCondensed(
                  fontSize: 30,
                ),
              ),
            SizedBox(height: 20),
            Text(
              'Wynik: ' + newScore.toString(),
              style: GoogleFonts.robotoCondensed(
                fontSize: 30,
              ),
            ),
            if (flag2 != flag) SizedBox(height: 20),
            if (flag2 != flag)
              Text(
                'Poprzednia liczba: ' + number.toString(),
                style: GoogleFonts.robotoCondensed(
                  fontSize: 20,
                ),
              ),
            if (flag2 == flag)
              Text(
                number2.toString(),
                style: GoogleFonts.robotoCondensed(
                  fontSize: 180,
                  fontWeight: FontWeight.w700,
                ),
              ),
            if (flag2 != flag)
              Text(
                'Nowa liczba: ' + number2.toString(),
                style: GoogleFonts.robotoCondensed(
                  fontSize: 20,
                ),
              ),
            if (flag2 == flag)
              Text(
                'Następna liczba będzie...',
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoCondensed(
                  fontSize: 30,
                ),
              ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (flag2 == flag)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => Higher(
                                number: number2, score: newScore, flag: true)),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Wyższa',
                        style: GoogleFonts.robotoCondensed(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                if (flag2 == flag) const SizedBox(width: 20),
                if (flag2 == flag)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => Higher(
                                number: number2, score: newScore, flag: false)),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Niższa',
                        style: GoogleFonts.robotoCondensed(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                if (flag2 != flag)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.pink),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) =>
                                firstPage(number: number, score: score)),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Spróbuj ponownie',
                        style: GoogleFonts.robotoCondensed(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
