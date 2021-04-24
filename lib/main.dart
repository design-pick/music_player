import 'package:flutter/material.dart';
import 'package:music_player/player.dart';

import 'dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'poppins',
    
      ),
      debugShowCheckedModeBanner: false,
      home: Player(),
    );
  }
}