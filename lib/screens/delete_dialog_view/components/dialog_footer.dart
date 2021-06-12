import 'package:ctse_flutter_app/screens/delete_view/deleteView.dart';
import 'package:flutter/material.dart';

class DialogFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children : <Widget>[
        SizedBox(height: 70),
        FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
          ),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_){
                return DeleteView();
              }));
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20 , right: 20 , top: 10 , bottom: 10),
            child: Text(
              "Yes",
              style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple.shade300,
              ),
            ),
          )
        ),
        SizedBox(width: 30),
        FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_){
                    return DeleteView();
                  }));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20 , right: 20 , top: 10 , bottom: 10),
              child: Text(
                "No",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple.shade300,
                ),
              ),
            )
        ),
      ]
    );
  }
}
