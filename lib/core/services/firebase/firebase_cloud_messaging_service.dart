import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:fruit_shop/core/services/cloud_messaging_service.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

class FirebaseCloudMessagingService extends CloudMessagingService {
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<String?> getDeviceToken() async {
    final notificationSettings = await FirebaseMessaging.instance
        .requestPermission(provisional: true);
    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      return await _firebaseMessaging.getToken();
    }
    return null;
  }

  @override
  Future<AccessCredentials> getAccessToken() async {
    const String serviceAccountPath = 'fruit-shop-cloud-messaging.json';
    String serviceAccountJson = await rootBundle.loadString(serviceAccountPath);
    final serviceAccount = ServiceAccountCredentials.fromJson(
      serviceAccountJson,
    );
    final scopes = ['https://www.googleapis.com/auth/firebase.messaging'];
    final client = await clientViaServiceAccount(serviceAccount, scopes);
    return client.credentials;
  }

  Future<void> sendNotification() async {
    final deviceToken = await getDeviceToken();
    if (deviceToken == null) {
      return;
    }
    final client = await getAccessToken();
    final accessToken = client.accessToken.data;
    final url = Uri.parse(
      'https://fcm.googleapis.com/v1/projects/fruit-shop-c8538/messages:send',
    );
    Map<String, String>? headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    Map<String, dynamic> body = {
      "message": {
        "token": deviceToken,
        "notification": {
          "body": "This is an FCM notification message!",
          "title": "FCM Message",
        },
      },
    };
    await http.post(url, headers: headers, body: jsonEncode(body));
  }
}




// POST https://fcm.googleapis.com/v1/projects/myproject-b5ae1/messages:send HTTP/1.1

// Content-Type: application/json
// Authorization: Bearer ya29.ElqKBGN2Ri_Uz...HnS_uNreA

// {
//    "message":{
//       "token":"bk3RNwTe3H0:CI2k_HHwgIpoDKCIZvvDMExUdFQ3P1...",
//       "notification":{
//         "body":"This is an FCM notification message!",
//         "title":"FCM Message"
//       }
//    }
// }