
abstract class DatabaseService {
  // Adding data to the database
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  String? documentId,
  });
  // Getting data from the database
  Future<dynamic> getData({
    required String path,
     String? documentId,
     Map<String, dynamic>? query
  });

  Future<bool> checkIsDataExist({
    required String path,
    required String documentId,
  });
}
