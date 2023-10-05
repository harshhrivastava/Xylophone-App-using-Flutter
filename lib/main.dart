import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({super.key});

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {

  void playSound(int noteNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource("note$noteNumber.wav"));
  }

  Widget musicTile(int noteNumber, MaterialColor tileColor) => Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: tileColor,
          padding: EdgeInsets.zero,
          shadowColor: null,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          )
        ),
        onPressed: () async {
          playSound(noteNumber);
        },
        child: Container(),
      ),
    );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              musicTile(1, Colors.red),
              musicTile(2, Colors.orange),
              musicTile(3, Colors.yellow),
              musicTile(4, Colors.green),
              musicTile(5, Colors.teal),
              musicTile(6, Colors.blue),
              musicTile(7, Colors.purple),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
