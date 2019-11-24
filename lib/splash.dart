import 'dart:async';

import 'package:flutter/material.dart';
import 'package:poker_cards/cards.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(
      Duration(seconds: 1),
      (_) => Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => Cards())),
    );

    return Container(
      color: Color.fromRGBO(74,0,128, 0),
      child: Center(
        child: Image.asset(
          'images/cerebro-memoria_0.jpg',
          width: 1000,
          height: 1000,
        ),
      ),
    );
  }
}
