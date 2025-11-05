abstract class DatabaseService {
  // Adding data to the database
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });
  // Getting data from the database
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  });

  /// Find a document id by a field value in a collection. Returns the document id
  /// if found, otherwise null.
  Future<String?> findDocumentIdByField({
    required String path,
    required String field,
    required dynamic value,
  });
  Future<bool> checkIsDataExist({
    required String path,
    required String documentId,
  });
}
