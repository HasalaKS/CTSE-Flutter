import 'package:flutter/material.dart';

class DialogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15 , bottom: 15 , left: 10),
        child: Icon(Icons.restore_from_trash ,
                color: Colors.deepPurple.shade300,
                size:60
            )
      ),
    );
  }
}
