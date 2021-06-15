import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:technology_app/common_helpers/DialogHelper.dart';
import 'package:technology_app/edit/edit.dart';
import 'package:technology_app/model/technology.dart';

import '../../../constants.dart';

class TechnologyList extends StatefulWidget {
  @override
  _TechnologyListState createState() => _TechnologyListState();
}

class _TechnologyListState extends State<TechnologyList> {

  // Initialize the collection Name
  String fireStoreCollectionName = "TechnologyDB";

  // Method to get all technologies from the database
  getAllTechnologies(){
    return FirebaseFirestore.instance.collection(fireStoreCollectionName).snapshots();
  }

  // Method to delete the technology from the database
  deleteTechnology(Technology technology){
    FirebaseFirestore.instance.runTransaction(
            (Transaction transaction) async{
          await transaction.delete(technology.documentReference);
        }).whenComplete(() => DialogHelper.deleteConform(context)
    );
  }

  // Implement the list
  Widget buildBody(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream: getAllTechnologies(),
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
    return ListView(
      children: snapshot.map((data) => listItemBuild(context , data)).toList(),
    );
  }

  // Implement list item
  Widget listItemBuild(BuildContext context , DocumentSnapshot data){
    final technology = Technology.fromSnapshot(data);

    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        children: <Widget>[
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(24)),
              image: DecorationImage(
                scale: 4.2,
                image: AssetImage("assets/images/${technology.techImage}"),
                alignment: Alignment.center,
              ),
            ),
          ),
          SizedBox(width : 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(technology.techName,
                style: TextStyle(
                  fontSize: 25,
                  color: kDeleteFuncTextColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text("Learn in 5 min",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                    fontWeight: FontWeight.normal
                ),
              ),
            ],
          ),
          SizedBox(width : 16),
          Row(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  height: 58,
                  width: 58,
                  decoration: BoxDecoration(
                    color: Colors.green.shade200,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                      icon: Icon(Icons.edit , color: Colors.white, size: 30),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Edit()),
                        );
                      }
                  )
              ),
              SizedBox(width : 13),
              Container(
                  alignment: Alignment.center,
                  height: 59,
                  width: 59,
                  decoration: BoxDecoration(
                    color: Colors.red.shade200,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                      icon: Icon(Icons.restore_from_trash , color: Colors.white, size: 30,),
                      onPressed: () {
                        deleteTechnology(technology);
                      }
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:30 , left: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text("Your Courses List",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Flexible(child: buildBody(context))
        ],
      ),
    );
  }
}
