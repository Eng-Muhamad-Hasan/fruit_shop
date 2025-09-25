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
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  }) async {
    final data = await firebaseFirestore.collection(path).doc(documentId).get();
    return data.data() as Map<String, dynamic>;
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
