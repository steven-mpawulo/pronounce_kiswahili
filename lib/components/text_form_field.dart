import 'package:flutter/material.dart';

class MyTextFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  bool obscurePassword;
  bool forPassword;
  MyTextFormField({Key? key,
    required this.controller,
    required this.icon,
    required this.hintText,
    required this.obscurePassword,
    required this.forPassword,
  }) : super(key: key);

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.forPassword,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        enabledBorder: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(),
        suffixIcon: widget.obscurePassword ? IconButton(onPressed: (){setState(() {
          widget.forPassword = !widget.forPassword;
        });}, icon: widget.forPassword ? Icon(widget.icon, color: Colors.grey,) : Icon(widget.icon, color: Colors.grey,),) : const SizedBox(),
      ),
    );



  }
}
