import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import 'constants.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key key}) : super(key: key);

  @override
    _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final ImagePicker _picker = ImagePicker();
  PickedFile _imageFile;

  @override
  Widget build(BuildContext context) {
    //final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    //FocusNode myFocusNode = new FocusNode();

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          //width: double.infinity,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
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
                        SvgPicture.asset("assets/icons/arrow-left.svg"),
                        SvgPicture.asset("assets/icons/more-vertical.svg"),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Details", style: kSubheadingextStyle),
                        techImage(),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.symmetric(horizontal:0, vertical: 16),
                      child: Column(
                        children: [
                          TextFormField(
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            decoration: InputDecoration(
                              labelText: "Name",
                              labelStyle: TextStyle(fontSize: 16, color: Color(0xFFA0A5BD)),
                              fillColor: Color(0xFFF5F5F7),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Color(0xFF4285F4), width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Color(0xFFA0A5BD))
                              ),
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                          SizedBox(height: 12.0,),
                          TextFormField(
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            decoration: InputDecoration(
                              labelText: "Documentation",
                              labelStyle: TextStyle(fontSize: 16, color: Color(0xFFA0A5BD)),
                              fillColor: Color(0xFFF5F5F7),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Color(0xFF4285F4), width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Color(0xFFA0A5BD))
                              ),
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                        ],
                      )
                    ),
                    Text("Description", style: kSubheadingextStyle),
                    Container(
                        //padding: MediaQuery.of(context).viewInsets,
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.multiline,
                              maxLength: 300,
                              maxLines: 9,
                              style: TextStyle(fontSize: 18, color: Colors.black),
                              decoration: InputDecoration(
                                fillColor: Color(0xFFF5F5F7),
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Color(0xFF4285F4), width: 2),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Color(0xFFA0A5BD))
                                ),
                                contentPadding: EdgeInsets.all(20),
                              ),
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              ),
              //SizedBox(height: 60),
              Expanded(
                child: Container(
                  child: Stack(
                    children: <Widget>[
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
                            borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(30.0),
                              topRight: const Radius.circular(30.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 50,
                                color: kTextColor.withOpacity(.1),
                              ),
                            ],
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: kBlueColor,
                                  ),
                                  child: Text(
                                    "Submit",
                                    style: kSubtitleTextSyule.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget techImage() {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 50.0,
          backgroundImage: _imageFile == null ? AssetImage("assets/images/defaultTech.png") : FileImage(File(_imageFile.path)),
        ),
        Positioned(
          top: 38,
          left:38,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              size:25,
            ),
          )
        )
      ],
    );
  }

  Widget bottomSheet(){
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Image",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            TextButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

}
