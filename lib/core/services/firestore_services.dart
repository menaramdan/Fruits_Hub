import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_app/core/services/DataBaseServices.dart';

class FirestoreServices implements DataBaseServices {
  @override
  Future<void> getData({required String path, required Map<String, dynamic> data}) async{
await  FirebaseFirestore.instance.collection(path).add(data);
  }
}


