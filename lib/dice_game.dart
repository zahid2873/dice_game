import 'dart:math';

import 'package:dice_game/rules.dart';
import 'package:flutter/material.dart';

class DiceGame extends StatefulWidget {
  const DiceGame({Key? key}) : super(key: key);

  @override
  State<DiceGame> createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  final random = Random.secure();
  final dice_list = [
    'images/d1.png',
    'images/d2.png',
    'images/d3.png',
    'images/d4.png',
    'images/d5.png',
    'images/d6.png',
  ];
  int points = 0, diceSum = 0, index1 = 0, index2 = 0;
  String status = '';
  bool hasGameStarted = false;
  bool youWinTheGame = false;
  bool youLoseTheGame = false;
  bool getTheTargetPoints = false;
  String rollingStatus = '';
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice Games'),
        actions: [ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Rules()));
          },
          child: Text('Rules'),
        ),],
      ),
      body: Center(
        child: hasGameStarted
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        dice_list[index1],
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        dice_list[index2],
                        width: 100,
                        height: 100,
                      ),
                    ],
                  ),
                  Text(
                    'Dice Sum : $diceSum',
                    style: const TextStyle(fontSize: 25),
                  ),
                  if (youWinTheGame == true)
                    Text(
                      "You Win !!",
                      style: const TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  if (youLoseTheGame == true)
                    Text(
                      "You Lose !!",
                      style: const TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  if (getTheTargetPoints == true)
                    Text(
                      "Your target point is $points. Keep Rolling untill find same point",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  if (rollingStatus.isEmpty)
                    ElevatedButton(
                      onPressed: _rollTheDice,
                      child: Text(
                        'Roll',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  if (status.isNotEmpty)
                    ElevatedButton(
                        onPressed: reset,
                        child: Text(
                          'Reset',
                          style: TextStyle(fontSize: 24),
                        )),
                ],
              )
            : ElevatedButton(
                onPressed: () {
                  setState(() {
                    hasGameStarted = true;
                  });
                },
                child: Text('Start'),
              ),
      ),
    );
  }

  void _rollTheDice() {
    setState(() {
      index1 = random.nextInt(6);
      index2 = random.nextInt(6);
      diceSum = index1 + 1 + index2 + 1;
      if (count == 0) {
        if (diceSum == 7 || diceSum == 11) {
          youWinTheGame = true;
          status = 'reset';
          rollingStatus = 'NotRoll';
        } else if (diceSum == 2 || diceSum == 3 || diceSum == 12) {
          youLoseTheGame = true;
          status = 'reset';
          rollingStatus = 'NotRoll';
        } else {
          points = diceSum;
          getTheTargetPoints = true;
          status = '';
          rollingStatus = '';
          //status = 'Your target point is $points. Keep Rolling';
        }
      } else {
        if (points == diceSum) {
          youWinTheGame = true;
          status = 'reset';
          rollingStatus = 'NotRoll';
        } else if (diceSum == 7) {
          youLoseTheGame = true;
          status = 'reset';
          rollingStatus = 'NotRoll';
        } else {
          status = '';
          rollingStatus = '';
        }
      }
      count++;
    });
  }

  void reset() {
    setState(() {
      hasGameStarted = false;
      youWinTheGame = false;
      youLoseTheGame = false;
      getTheTargetPoints = false;
      diceSum = 0;
      index1 = 0;
      index2 = 0;
      status = '';
      points = 0;
      count = 0;
    });
  }
}
