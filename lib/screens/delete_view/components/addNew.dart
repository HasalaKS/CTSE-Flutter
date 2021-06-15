import 'package:flutter/material.dart';
import 'package:technology_app/add_screen.dart';

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
                color: kDeleteFuncTextColor.withOpacity(.1),
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
              child: TextButton(
                child: Text(
                    "Add New",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddScreen()),
                    );
                  }),
            ),
          )),
    );
  }
}
