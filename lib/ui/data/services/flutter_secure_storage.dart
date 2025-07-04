import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static final SecureStorageService _instance =
      SecureStorageService._internal();
  factory SecureStorageService() => _instance;
  SecureStorageService._internal();

  final _secureStorage = const FlutterSecureStorage();

  Future<void> saveToken(String clave, String valor) async {
    await _secureStorage.write(key: clave, value: valor);
  }

  Future<String?> getToken(String clave) async {
    return await _secureStorage.read(key: clave);
  }

  Future<void> deleteToken(String clave) async {
    await _secureStorage.delete(key: clave);
  }

  Future<void> clearStorage() async {
    await _secureStorage.deleteAll();
  }
}
