import 'package:flutter/material.dart';

import 'components/addNew.dart';
import 'components/header.dart';
import 'components/technologyList.dart';

import '../../constants.dart';

class DeleteView extends StatefulWidget {
  @override
  _DeleteViewState createState() => _DeleteViewState();
}

class _DeleteViewState extends State<DeleteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            scale: 3.6,
            image: AssetImage("assets/images/admin.jpg"),
            alignment: Alignment.topRight,
          ),
        ),
        child: Column(
          children: <Widget>[
            ViewHeader(),
            SizedBox(height: 45),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 50,
                      color: kDeleteFuncTextColor.withOpacity(.1),
                    ),],
                ),
                child: Stack(
                  children: <Widget>[
                    TechnologyList(),
                    AddNew(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}