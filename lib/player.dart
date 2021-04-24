import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_slider/music_slider.dart';

class Player extends StatelessWidget {
  const Player({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          blurRadius: 10.0,
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1553344518-c44926bebaa7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1653&q=80'))),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.black,
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 25,
                            )),
                        Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 2),
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.more_horiz,
                              size: 25,
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 12),
              child: Text(
                'Why art is expensive',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5),
              ),
            ),
            Text(
              'Chloe leung',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5),
            ),
            Padding(
              padding: const EdgeInsets.only(top:50.0,bottom:32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '0:00',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                  music_player(context),
                  Text(
                    '14:34',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ],
              ),
            ),
            musicController(),
            options(),
          ],
        ),
      ),
    );
  }

  music_player(context) {
    return MusicSlider(
      controller: MusicSliderController(initialValue: 0.3),
      height: 50,
      width: MediaQuery.of(context).size.width * 0.70,
      emptyColors: [Colors.grey.shade300],
      fillColors: [Colors.black],
      division: 45,
      boxSpace: 0.5,
      wave: (x, t, a) => a * cos(x * 0.5) * sin(x * 0.3),
    );
  }

  options() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32.0, right: 32.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Icon(
            CupertinoIcons.share,
            size: 25,
          ),
        ),
      ),
    );
  }

  musicController() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.fast_rewind, size: 30),
          Icon(Icons.skip_previous, size: 50),
          Icon(Icons.pause_circle_filled, size: 65),
          Icon(Icons.skip_next, size: 50),
          Icon(Icons.fast_forward, size: 30),
        ],
      ),
    );
  }
}
