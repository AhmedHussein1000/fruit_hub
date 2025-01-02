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
    Query<Map<String, dynamic>> data =  firestore.collection(path);
    if(query != null){
    if (query['orderBy'] != null) {
        data  = data.orderBy(query['orderBy'], descending: query['descending']); 
    } 
    if(query['limit'] != null){
      data = data.limit(query['limit']);
    }
    }
  var result = await data.get();
    return result.docs.map((e) => e.data()).toList();
  }

  Future<bool> checkIfDataExist(
      {required String path, required String docId}) async {
    var data = await firestore.collection(path).doc(docId).get();
    return data.exists;
  }
}
