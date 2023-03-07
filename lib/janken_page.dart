import 'dart:math';

import 'package:flutter/material.dart';

class JankenPage extends StatefulWidget {
  JankenPage({super.key});
  String title = 'じゃんけん';

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  final HANDS = ['✊', '✌️', '✋'];

  String myHand = 'じゃんけん..ぽん';
  String oppositeHand = 'じゃんけん..ぽん';
  String result = '勝負だ！';


  void changeMyHand(String action) {
    print(action);
    changeOppositeHand();
    myHand = action;
    judge();
    setState(() {});
  }

  void changeOppositeHand() {
    int rand = Random().nextInt(3);
    oppositeHand = HANDS[rand];
  }

  void judge() {
    if (myHand == oppositeHand) {
      result = '引き分け';
    } else {
      int _myHand = HANDS.indexOf(myHand);
      int _opHand = HANDS.indexOf(oppositeHand);
      if ((_myHand >= (HANDS.length - 1) && _opHand == 0) ||
          (_myHand == 0 && _opHand >= (HANDS.length - 1))) {
        result = (_myHand - _opHand) > 0 ? '勝ち' : '負け';
      } else {
        result = (_myHand - _opHand) > 0 ? '負け' : '勝ち';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                this.result,
                style: TextStyle(
                  fontSize: 32,
                )
            ),
            SizedBox(height: 64),
            Text(
                this.oppositeHand,
                style: TextStyle(
                  fontSize: 32,
                )
            ),
            SizedBox(height: 64),
            Text(
                this.myHand,
              style: TextStyle(
                fontSize: 32,
              )
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    changeMyHand('✊');
                  },
                  child: const Text('✊'),
                ),
                ElevatedButton(
                  onPressed: () {
                    changeMyHand('✌️');
                  },
                  child: const Text('✌️'),
                ),
                ElevatedButton(
                  onPressed: () {
                    changeMyHand('✋');
                  },
                  child: const Text('✋'),
                ),
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
