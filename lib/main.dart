import 'package:flutter/material.dart';
import 'package:poker_cards/splash.dart';

void main() => runApp(PokerCardsApp());

class PokerCardsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'planningpoker',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Splash(),
    );
  }
}