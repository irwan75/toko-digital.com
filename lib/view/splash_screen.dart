import 'dart:async';
import 'dart:ui';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:toko_digital/main.dart';

class SplashScreen extends StatefulWidget {
  String s;
  SplashScreen({this.s});

  @override
  _SplashScreenState createState() => _SplashScreenState(s: s);
}

class _SplashScreenState extends State<SplashScreen> {
  String s;
  _SplashScreenState({this.s});

  final assetsAudioPlayer = AssetsAudioPlayer();

  splash() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  void playAudio() async {
    assetsAudioPlayer.open(
      Audio("assets/audio/$s.mp3"),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // initPlayer();
    playAudio();
    splash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png", width: 300),
                SizedBox(height: 50),
                Image.asset("assets/images/medsos.png", width: 300),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
