import 'package:flutter/material.dart';

class CongratsIcon extends StatelessWidget {
  final String message;

  const CongratsIcon({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.greenAccent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.check,
            color: Colors.black,
            size: 50,
          ),
          SizedBox(height: 10),
          Text(
            message,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      width: 150,
      height: 150,
    );
  }
}
