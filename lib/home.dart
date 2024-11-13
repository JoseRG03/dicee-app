import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text('Dicee', style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white
        )),
      ),
      body: Center(
        child: Container(
            decoration: const BoxDecoration(
                gradient:
                LinearGradient(
                    colors:
                    [Colors.red,
                      Colors.blue],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)
            ),
            child: RollDice()
        ),
      ),
    );
  }
}

final random = Random();

class RollDice extends StatefulWidget {
  RollDice({
    super.key,
  });

  @override
  State<RollDice> createState() => _RollDiceState();
}

class _RollDiceState extends State<RollDice> {
  int dice1 = 1;
  int dice2 = 1;

  void rollDice() {
    setState(() {
      dice1 = random.nextInt(6) + 1;
      dice2 = random.nextInt(6) + 1;
    });
  }

  String validateWinner() {
    if (dice2 > dice1) {
      return "Player 2 Wins!";
    } else if (dice1 > dice2) {
      return "Player 1 Wins!";
    } else {
      return "Tie!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50,),
        Text(validateWinner(), style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
        SizedBox(height: 50,),
        Row(
          children: [
            Expanded(child: TextButton(
                onPressed: rollDice,
                child: Image.asset('images/dice$dice1.png'))),
            Expanded(child: TextButton(
                onPressed: rollDice,
                child: Image.asset('images/dice$dice2.png'))),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 25),
          child: GestureDetector(
            onTap: rollDice,
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                  child: Text("Roll Dice", style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}