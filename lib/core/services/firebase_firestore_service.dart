import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_shop/core/services/database_service.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firebaseFirestore.collection(path).doc(documentId).set(data);
    } else {
      await firebaseFirestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      //return a specific doc data from a collection as a Map<String, dynamic>
      final data = await firebaseFirestore
          .collection(path)
          .doc(documentId)
          .get();
      return data.data();
    } else {
      //return all docs data from a collection as a List<Map<String, dynamic>>
      Query<Map<String, dynamic>> data = firebaseFirestore.collection(path);
      if (query != null) {
        if (query["orderBy"] != null && query["limit"] != null) {
          String orderByField = query["orderBy"].toString();
          bool descending = query["descending"];
          final limit=query["limit"];
      final result =  await data.orderBy(orderByField, descending: descending).limit(limit).get();
         return result.docs.map((e) => e.data()).toList();
        }
      } else {
      final  result = await data.get();
      return result.docs.map((e) => e.data()).toList();
      }
    }
  }

  @override
  Future<bool> checkIsDataExist({
    required String path,
    required String documentId,
  }) async {
    final data = await firebaseFirestore.collection(path).doc(documentId).get();
    return data.exists;
  }
}
