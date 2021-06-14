import 'package:flutter/material.dart';
import 'package:technology_app/common_helpers/DialogHelper.dart';
import 'package:technology_app/edit/edit.dart';

import '../../../constants.dart';

class TechnologyList extends StatefulWidget {
  @override
  _TechnologyListState createState() => _TechnologyListState();
}

class _TechnologyListState extends State<TechnologyList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Your Courses List", style: kTitleTextStyle),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: <Widget>[
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                ),
                SizedBox(width: 18),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "React JS",
                      style: TextStyle(
                        fontSize: 25,
                        color: kTextColor,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "Learn in 5 min",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                SizedBox(width: 18),
                Row(
                  children: <Widget>[
                    FlatButton(
                      height: 64,
                      minWidth: 30,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                      color: Colors.green.shade200,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Edit()),
                        );
                      },
                      child: Icon(Icons.edit, color: Colors.white, size: 39),
                    ),
                    SizedBox(width: 10),
                    FlatButton(
                      height: 65,
                      minWidth: 30,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      color: Colors.red.shade200,
                      onPressed: () {
                        DialogHelper.deleteConform(context);
                      },
                      child: Icon(
                        Icons.restore_from_trash,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
