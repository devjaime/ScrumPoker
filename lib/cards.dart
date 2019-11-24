import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Cards extends StatelessWidget {
  final items = [
    '0',
    '1',
    '2',
    '3',
    '5',
    '8',
    '13',
    '21',
    '34',
    '55',
    '89',
    '144',
    '∞',
    '?',
    '☕',
  ];

  @override
  Widget build(BuildContext context) {
    final list = items.map((text) {
      int min = 0;
      int max = 3;

      Random rnd = Random();
      final index = min + rnd.nextInt(max - min);
      final animations = ['Celebrate Duplicate', 'Celebrate Duplicate','Celebrate Duplicate'];

      String animation = animations[index];
      print(animation);
      final smallMinionSize = MediaQuery.of(context).size.height * 0.10;
      return GestureDetector(
        child: PokerCard(
          text: text,
          animation: animation,
          minionSize: smallMinionSize,
        ),
        onTap: () {
          final verticalMargin = MediaQuery.of(context).size.height * 0.12;
          final minionSize = MediaQuery.of(context).size.height * 0.3;
          showDialog(
            context: context,
            child: FlipCard(
              direction: FlipDirection.VERTICAL,
              back: Container(
                color: Colors.deepOrangeAccent,
                margin: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: verticalMargin,
                ),
                child: PokerCard(
                  text: text,
                  animation: animation,
                  minionSize: minionSize,
                ),
              ),
              front: Container(
                color: Colors.black,
                margin: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: verticalMargin,
                ),
                child: MinionOnlyCard(
                  animation: animation,
                  minionSize: 350,
                ),
              ),
            ),
          );
        },
      );
    }).toList();

    return Container(
      color: Colors.blueGrey,
      
      padding: EdgeInsets.symmetric(horizontal: 58),
      child: AnimationLimiter(
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 0.73,
          crossAxisSpacing: 2.5,
          semanticChildCount: items.length,
          children: List.generate(
            list.length,
            (index) => AnimationConfiguration.staggeredGrid(
              position: index,
              duration: Duration(milliseconds: 375),
              columnCount: 3,
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: list[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PokerCard extends StatelessWidget {
  const PokerCard({
    this.text,
    this.animation,
    this.minionSize,
  });

  final String text;
  final String animation;
  final double minionSize;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: text != '☕' ? minionSize * 0.4 : 40,
                fontWeight: FontWeight.w500,
                fontFamily: 'Minion',
                color: Colors.cyan,
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            right: -15,
            child: Container(
              width: minionSize,
              height: minionSize,
              child: FlareActor(
                "images/scrum.flr",
                animation: animation,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MinionOnlyCard extends StatelessWidget {
  const MinionOnlyCard({
    @required this.animation,
    @required this.minionSize,
  });

  final String animation;
  final double minionSize;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Center(
        child: Container(
          width: minionSize,
          height: minionSize,
          child: FlareActor(
            "images/scrum.flr",
            animation: animation,
          ),
        ),
      ),
    );
  }
}
