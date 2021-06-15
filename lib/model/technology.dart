import 'package:cloud_firestore/cloud_firestore.dart';

class Technology{

  String techName;
  String techSite;
  String techDesc;
  String techImage;

  DocumentReference documentReference;

  Technology({
      this.techName,
      this.techSite,
      this.techDesc,
      this.techImage
  });

  Technology.fromMap(Map<String,dynamic> map, {this.documentReference}){
    techName = map["techName"];
    techSite = map["techSite"];
    techDesc = map["techDesc"];
    techImage = map["techImage"];
  }

  Technology.fromSnapshot(DocumentSnapshot snapshot)
   :this.fromMap(snapshot.data(), documentReference:snapshot.reference);

  toJson(){
    return {'techName': techName, 'techSite': techSite, 'techDesc': techDesc, 'techImage': techImage};
  }
}