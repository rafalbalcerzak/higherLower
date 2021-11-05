import 'package:flutter/material.dart';
import 'dart:math';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Higher or lower'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(number.toString()),
            Text('next'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) =>
                              Higher(number: number, score: score, flag: true)),
                    );
                  },
                  child: Text('Higher'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => Higher(
                              number: number, score: score, flag: false)),
                    );
                  },
                  child: Text('Lower'),
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
      appBar: AppBar(
        title: Text('Higher or lower'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('last: ' + number.toString()),
            Text('current: ' + number2.toString()),
            Text('Score: ' + newScore.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (flag2 == flag)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => Higher(
                                number: number2, score: newScore, flag: true)),
                      );
                    },
                    child: Text('Higher'),
                  ),
                const SizedBox(width: 20),
                if (flag2 == flag)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => Higher(
                                number: number2, score: newScore, flag: false)),
                      );
                    },
                    child: Text('Lower'),
                  ),
                if (flag2 != flag)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.popUntil(
                          context, (Route<dynamic> route) => route.isFirst);
                    },
                    child: Text('zacznij od nowa'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
