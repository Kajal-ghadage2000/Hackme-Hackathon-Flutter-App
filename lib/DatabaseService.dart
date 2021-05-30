import 'ModelClass.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  /*static Future<List<Model>> getModels() async {
    Query needsSnapshot = await Firestore.instance.collection("Hackthon-Events").getDocuments();

    //Firestore.instance.collection("Hackthon-Events").getDocuments()
    print(needsSnapshot); // to debug and see if data is returned

    List<Model> needs;

    Map<dynamic, dynamic> values = needsSnapshot.data.values;
    values.forEach((key, values) {
      needs.add(Model.fromSnapshot(values));
    });

    return needs;
  }*/
}