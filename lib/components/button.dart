import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final onButtonPressed;
  const MyButton({Key? key, required this.buttonText, required this.onButtonPressed,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 400.0,
      decoration: const BoxDecoration(
        color: Colors.greenAccent,
      ),
      child: MaterialButton(
        onPressed: onButtonPressed,
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
