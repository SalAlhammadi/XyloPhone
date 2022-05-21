import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int noteNo){
    final player = AudioCache();
    player.play('note$noteNo.wav');
}

FlatButton buildKey(int no){
    var j = 700;
    if (no%2==0) j = 900; else j = 700;
  return FlatButton(
    color: Colors.blueGrey[j],
    onPressed:(){
      playSound(no);
    },
  );
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black26,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            for (int i = 1 ; i < 8 ; i++)
              Expanded(child: buildKey(i))
            ],
          ),
        ),
      ),
    );
  }
}
