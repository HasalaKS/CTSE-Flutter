import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:technology_app/main_menu_screen.dart';

import '../../../constants.dart';

class ViewHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, top: 50, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                      icon: SvgPicture.asset("assets/icons/menu.svg"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainMenu()),
                        );
                      }
                  )
              ),
              Container(
                height: 48,
                width: 48,
                child: Icon(Icons.account_circle , size: 48.00, color: Colors.black26,),
              ),
            ],
          ),
          SizedBox(height: 30),
          Text("Hey Jane..,",
            style: TextStyle(
                fontSize: 28,
                color: kDeleteFuncTextColor,
                fontWeight: FontWeight.normal
            ),
          ),
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
                        fontSize: 18,
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
                        fontSize: 18,
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
