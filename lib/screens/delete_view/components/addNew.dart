import 'package:flutter/material.dart';

import '../../../constants.dart';

class AddNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      bottom: 0,
      child: Container(
          padding: EdgeInsets.all(20),
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 50,
                color: kTextColor.withOpacity(.1),
              ),
            ],
          ),
          child: Expanded(
            child: Container(
              alignment: Alignment.center,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.deepPurple.shade300,
              ),
              child: Text(
                  "Add new",
                  style: kSubtitleTextSyule
              ),
            ),
          )
      ),
    );
  }
}
