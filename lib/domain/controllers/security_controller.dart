import 'package:injectable/injectable.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

@LazySingleton()
class SecurityController {
  static String hashPassword(String password) {
    var key = utf8.encode('mp_pasword');
    var bytes = utf8.encode(password);

    var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);

    print("HMAC digest as bytes: ${digest.bytes}");
    print("HMAC digest as hex string: $digest");
    return digest.toString();
  }
  // static bool checkUser() {
  //   return true;
  // }
}
