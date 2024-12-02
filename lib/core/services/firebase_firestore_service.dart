import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub/core/services/database_service.dart';

class FirestoreService extends DatabaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? docId}) async {
    if (docId != null) {
      await firestore.collection(path).doc(docId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData(
      {required String path,
      String? docId,
      Map<String, dynamic>? query}) async {
    if (docId != null) {
      DocumentSnapshot documentSnapshot =
          await firestore.collection(path).doc(docId).get();
      return documentSnapshot.data();
    }
    QuerySnapshot querySnapshot = await firestore.collection(path).get();
    return querySnapshot.docs.map((e) => e.data()).toList();
  }

  Future<bool> checkIfDataExist(
      {required String path, required String docId}) async {
    var data = await firestore.collection(path).doc(docId).get();
    return data.exists;
  }
}
