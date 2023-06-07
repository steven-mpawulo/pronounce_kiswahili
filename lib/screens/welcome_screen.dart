import 'package:flutter/material.dart';
import 'package:pronounce_kiswahili/components/button.dart';
import 'package:pronounce_kiswahili/screens/login_screen.dart';
import 'package:pronounce_kiswahili/screens/recording_screen.dart';
import 'package:pronounce_kiswahili/screens/sign_up.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            left: 16.0,
            right: 16.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Pronounce Kiswahili",
                style: TextStyle(
                  fontSize: 28.0,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Speak Kiswahili like a native.",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    "Learn from anywhere and at any time.",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    "It's fun.",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              MyButton(
                buttonText: "Get Started",
                onButtonPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const SignUpScreen();
                  }));
                },
              ),
              const SizedBox(height: 16.0),
              MyButton(
                buttonText: "Log In",
                onButtonPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const LogInScreen();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
