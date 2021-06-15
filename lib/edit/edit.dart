import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants.dart';
import '../model/technology.dart';
import '../screens/delete_view/deleteView.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Edit extends StatefulWidget {
  final Technology technology;

  Edit({Key key, this.technology}) : super(key: key);

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {

  TextEditingController techNameController = TextEditingController();
  TextEditingController techSiteController = TextEditingController();
  TextEditingController techDescController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    techNameController.text = widget.technology.techName;
    techSiteController.text = widget.technology.techSite;
    techDescController.text = widget.technology.techDesc;
  }

  final ImagePicker _picker = ImagePicker();
  PickedFile _imageFile;

  //File techImageFile;
  String imgUrl;
  File imgSelected;

  updateTechnology(){
    try{
      FirebaseFirestore.instance.runTransaction((transaction) async{
        var storeImage = FirebaseStorage.instance.ref().child(imgSelected.path);
        var uploadTask = storeImage.putFile(imgSelected);
        imgUrl = await (await uploadTask).ref.getDownloadURL();

        await transaction.update(widget.technology.documentReference, {'techName': techNameController.text, 'techSite': techSiteController.text, 'techDesc': techDescController.text, 'techImage': imgUrl.toString()});

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DeleteView()),
        );

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Successfully added.'),
          duration: const Duration(seconds: 3),
        ));
      });
    }catch(e){
      print(e.toString());
    }
  }

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
                          Text("Details", style: kSubheadingextStyle2),
                          techImage(),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          padding: EdgeInsets.symmetric(horizontal:0, vertical: 16),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: techNameController,
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
                                controller: techSiteController,
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
                      Text("Description", style: kSubheadingextStyle2),
                      Container(
                        //padding: MediaQuery.of(context).viewInsets,
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: techDescController,
                                keyboardType: TextInputType.multiline,
                                maxLength: 300,
                                maxLines: 7,
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
                //SizedBox(height: 30),

                Container(
                  padding: EdgeInsets.all(20),
                  height: 90,
                  width: double.maxFinite,
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
                  child: Row(children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          updateTechnology();
                          },
                        child: Container(
                          alignment: Alignment.center,
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.deepPurple.shade300,
                          ),
                          child: Text(
                            "Submit",
                            style: kSubtitleTextSyule.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
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
          backgroundImage: imgSelected == null
              ? NetworkImage(widget.technology.techImage)
              : FileImage(imgSelected),
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
      imgSelected = File(pickedFile.path);
    });
  }

}