import 'package:flutter/material.dart';
import 'package:pronounce_kiswahili/components/button.dart';
import 'package:pronounce_kiswahili/components/congrats_icon.dart';
import 'package:pronounce_kiswahili/screens/recording_screen.dart';

class ResultScreen extends StatelessWidget {
  final String phonemeForText;
  final String phonemeForWord;
  final bool pronunciationResult;

  const ResultScreen({
    Key? key,
    required this.phonemeForText,
    required this.phonemeForWord,
    required this.pronunciationResult,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.greenAccent,
        title: const Text(
          "Pronounce Kiswahili",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0),
        child: Column(
          children: [
            CongratsIcon(
  message: "Well Done!",
),
SizedBox(height: 20),

            Text(
              'Pronunced word phoneme: ${phonemeForText}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Actual word phoneme: ${phonemeForWord}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              pronunciationResult ? "Pronunciation is correct": "Pronunciation is incorrect",
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(height: 20),
            MyButton(
              buttonText: "Try Again",
              onButtonPressed: (){
                Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return const RecordingScreen();
                            }));
              },
            ),
          ],
        ),
      ),
      );
  }
}
