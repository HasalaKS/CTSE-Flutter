import 'package:flutter/material.dart';

class DialogMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20 , right: 20),
      child: Text("Technology is deleted successfully..!" ,
        style: TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            fontFamily: 'Nunito'
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
