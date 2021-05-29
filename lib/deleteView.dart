import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'constants.dart';

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
            Padding(
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
                        child: Icon(Icons.account_circle , size: 48.00, color: Colors.black38,),
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
                          Text("100 follows" ,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: <Widget>[
                          SvgPicture.asset("assets/icons/star.svg"),
                          SizedBox(width: 10),
                          Text("Your ratings 3.5" ,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
                      color: kTextColor.withOpacity(.1),
                    ),
                  ],
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30),
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
                                      borderRadius: BorderRadius.all(Radius.circular(24))
                                  ),
                                ),
                                SizedBox(width : 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("React JS",
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: kTextColor,
                                          fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    Text("Learn in 5 min",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width : 25),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.green.shade200,
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.all(Radius.circular(24))
                                      ),
                                      child: Icon(Icons.edit , color: Colors.white, size: 40,),
                                    ),
                                    SizedBox(width : 10),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.red.shade200,
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.all(Radius.circular(24))
                                      ),
                                        child: Icon(Icons.restore_from_trash , color: Colors.white, size: 40,)
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
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
                    ),
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