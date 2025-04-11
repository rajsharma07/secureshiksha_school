import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:secureshiksha_school/core/constants.dart';

class SecureStorage {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<void> addToken(String token) async {
    await _secureStorage.write(key: tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: tokenKey);
  }

  Future<void> removeToken() async {
    await _secureStorage.delete(key: tokenKey);
  }
}
