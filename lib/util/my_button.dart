import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonname;
  VoidCallback onsave;
  MyButton({super.key, required this.buttonname, required this.onsave});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onsave,
      child: Text(buttonname),
    );
  }
}
