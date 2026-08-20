import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_app/core/services/DataBaseServices.dart';

class FirestoreServices implements DataBaseServices {
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    await FirebaseFirestore.instance.collection(path).add(data);
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentID,
  }) async {
    var data = await FirebaseFirestore.instance
        .collection(path)
        .doc(documentID)
        .get();
    return data.data() as Map<String, dynamic>;
  }
}
