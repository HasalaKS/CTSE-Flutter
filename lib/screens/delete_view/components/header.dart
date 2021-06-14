import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class ViewHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 50, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SvgPicture.asset("assets/icons/menu.svg"),
              Container(
                height: 48,
                width: 48,
                child: Icon(
                  Icons.account_circle,
                  size: 48.00,
                  color: Colors.black38,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Text("Hey Jane..,", style: kHeadingextStyle),
          SizedBox(height: 16),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  SvgPicture.asset("assets/icons/person.svg"),
                  SizedBox(width: 10),
                  Text(
                    "100 follows",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: <Widget>[
                  SvgPicture.asset("assets/icons/star.svg"),
                  SizedBox(width: 10),
                  Text(
                    "Your ratings 3.5",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
