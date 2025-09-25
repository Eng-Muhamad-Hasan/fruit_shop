
abstract class DatabaseService {
  // Adding data to the database
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  String? documentId,
  });
  // Getting data from the database
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  });

  Future<bool> checkIsDataExist({
    required String path,
    required String documentId,
  });
}
