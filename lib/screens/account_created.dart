import 'package:flutter/material.dart';
import 'package:pronounce_kiswahili/screens/recording_screen.dart';
import 'package:pronounce_kiswahili/components/button.dart';
import 'package:pronounce_kiswahili/components/congrats_icon.dart';


class AccountCreatedScreen extends StatefulWidget {
  const AccountCreatedScreen({ Key? key }) : super(key: key);

  @override
  _AccountCreatedScreenState createState() => _AccountCreatedScreenState();
}

class _AccountCreatedScreenState extends State<AccountCreatedScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CongratsIcon(
  message: "Account created!",
),
SizedBox(height: 20),
 MyButton(buttonText: "Proceed to home", onButtonPressed: (){
  Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return const RecordingScreen();
                              }));
 }),

          ],
        ),
        ),
      ), 
    );
  }
}
