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
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      final docRef = firebaseFirestore.collection(path).doc(documentId);

      // If we're updating sellingCount, use increment
      if (data.containsKey('sellingCount')) {
        final increment = data['sellingCount'] as int;
        await docRef.update({
          'sellingCount': FieldValue.increment(increment),
          if (data.containsKey('lastUpdated'))
            'lastUpdated': data['lastUpdated'],
        });
      } else {
        // For other updates, use set with merge
        await docRef.set(data, SetOptions(merge: true));
      }
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
       
        // support orderBy + limit
        if (query["orderBy"] != null && query["limit"] != null) {
          String orderByField = query["orderBy"].toString();
          bool descending = query["descending"] ?? false;
          final limit = query["limit"] as int;
          final result = await data
              .orderBy(orderByField, descending: descending)
              .limit(limit)
              .get();
          return result.docs.map((e) => e.data()).toList();
        }
        // support orderBy
       else if (query["orderBy"] != null) {
          String orderByField = query["orderBy"].toString();
          bool descending = query["descending"] ?? false;
          final result = await data
              .orderBy(orderByField, descending: descending)
              .get();
          return result.docs.map((e) => e.data()).toList();
        }
        // support where filter: { 'whereField': 'code', 'whereValue': 'P001' }
        if (query["whereField"] != null && query["whereValue"] != null) {
          final whereField = query["whereField"].toString();
          final whereValue = query["whereValue"];
          final result = await data
              .where(whereField, isEqualTo: whereValue)
              .get();
          return result.docs.map((e) => e.data()).toList();
        }

        // fallback to simple get
        final result = await data.get();
        return result.docs.map((e) => e.data()).toList();
      } else {
        final result = await data.get();
        return result.docs.map((e) => e.data()).toList();
      }
    }
  }

  @override
  Future<String?> findDocumentIdByField({
    required String path,
    required String field,
    required dynamic value,
  }) async {
    final result = await firebaseFirestore
        .collection(path)
        .where(field, isEqualTo: value)
        .limit(1)
        .get();
    if (result.docs.isEmpty) return null;
    return result.docs.first.id;
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
