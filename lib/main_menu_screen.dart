import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:technology_app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:technology_app/model/category.dart';
import 'package:technology_app/details_screen.dart';
import 'package:technology_app/screens/delete_view/deleteView.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './model/technology.dart';
import 'add_screen.dart';

class MainMenu extends StatelessWidget {
  // Initialize the collection Name
  String fireStoreCollectionName = "Technologies";

  // Method to get all technologies from the database
  getAllTechnologies(){
    return FirebaseFirestore.instance.collection(fireStoreCollectionName).snapshots();
  }

  // Implement the list
  Widget buildBody(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream: getAllTechnologies(),
      // ignore: missing_return
      builder: (context,snapshot){
        if(snapshot.hasError){
          return Text('Error ${snapshot.error}');
        }
        if(snapshot.hasData){
          print("Documents -> ${snapshot.data.docs.length}");
          return buildList(context , snapshot.data.docs);
        }
      },
    );
  }

  Widget buildList(BuildContext context , List<DocumentSnapshot> snapshot){
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 30,
      mainAxisSpacing: 30,
      children: snapshot.map((data) => listItemBuild(context , data)).toList(),
    );
  }

  // Implement list item
  Widget listItemBuild(BuildContext context , DocumentSnapshot data){
    final technology = Technology.fromSnapshot(data);

    return  InkWell(
      onTap: () {
        print("Click event on Container");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsScreen()),
        );
      },
      child: Container(
        padding: EdgeInsets.all(20),
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: NetworkImage(technology.techImage),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              technology.techName,
              style: kTitleTextStyle,
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .52,
            decoration: BoxDecoration(
              color: primary,
              image: DecorationImage(
                scale: 2.5,
                alignment: Alignment.centerRight,
                image: AssetImage("assets/images/menuBackground.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: primaryDarkSemi,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                            icon: SvgPicture.asset("assets/icons/menu.svg"),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DeleteView()),
                              );
                            })),
                  ),
                  Text("Welcome,", style: mainMenuHeading),
                  Text("Technology is best when it brings \npeople together",
                      style: mainMenuSubHeadingNormal),
                  SizedBox(height: 80),
                  Text("Category", style: mainMenuSubHeading),
                  Expanded(
                    child:Flexible(child: buildBody(context))
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
