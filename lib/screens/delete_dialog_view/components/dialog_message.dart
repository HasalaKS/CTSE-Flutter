import 'package:flutter/material.dart';

class DialogMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Are sure you want to delete the technology ?" ,
      style: TextStyle(
          fontSize: 28,
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal
      ),
      textAlign: TextAlign.center,
    );
  }
}
