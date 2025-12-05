import 'package:googleapis_auth/googleapis_auth.dart';

abstract class CloudMessagingService {
  Future<AccessCredentials> getAccessToken();
}
