import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:helpme/core/api/api_constants.dart';
import 'package:helpme/core/utils/log_util.dart';
import 'package:helpme/signin/data/signin_repository.dart';

class Auth {
  final String pinCode;
  final String authToken;
  final int lastLogin;
  final String method;

  Auth(
    this.pinCode,
    this.lastLogin,
    this.authToken,
    this.method,
  );
}

class AuthService {
  static const _storage = FlutterSecureStorage();
  static const _sessionTime = 24 * 60 * 60 * 1000;
  
  static const _kAuthToken = 'authToken';
  static const _kPinCode = 'pinCode';
  static const _kLastLogin = 'lastLogin';
  static const _kMethod = 'method';

  static Future<bool> get isAuthorized async =>
    await _storage.read(key: _kPinCode) != null &&
    await _storage.read(key: _kLastLogin) != null &&
    await _storage.read(key: _kAuthToken) != null &&
    await _storage.read(key: _kMethod) != null;

  static Future<bool> get needRelogin async {
    final lastLogin = await _storage.read(key: _kLastLogin);
    return int.parse(lastLogin!) + _sessionTime < DateTime.now().millisecondsSinceEpoch;
  }

  static Future<void> setAuth({
    String? pinCode,
    int? lastLogin,
    String? authToken,
    String? method,
  }) async {
    if (pinCode != null) {
      await _storage.write(key: _kPinCode, value: pinCode);
    }

    if (lastLogin != null) {
      await _storage.write(key: _kLastLogin, value: lastLogin.toString());
    }

    if (authToken != null) {
      await _storage.write(key: _kAuthToken, value: authToken);
    }

    if (method != null) {
      await _storage.write(key: _kMethod, value: method);
    }
  }

  static Future<Auth> getAuth() async {
    final pinCode = await _storage.read(key: _kPinCode);
    final lastLogin = await _storage.read(key: _kLastLogin);
    final authToken = await _storage.read(key: _kAuthToken);
    final method = await _storage.read(key: _kMethod);
    
    return Auth(pinCode!, int.parse(lastLogin!), authToken!, method!);
  }

  static Future<bool> relogin() async {
    if (!await isAuthorized) {
      LogUtility.info(
        tag: 'AuthService.relogin',
        message: 'User is not authorized',
      );
      return false;
    }

    if (!await needRelogin) {
      LogUtility.info(
        tag: 'AuthService.relogin',
        message: 'Relogin is not required',
      );
      return true;
    }

    final auth = await getAuth();
    if (auth.method != 'google') {
      LogUtility.warning(
        tag: 'AuthService.relogin',
        message: 'Auth method is not Google',
      );
      return false;
    }

    final googleSignIn = GoogleSignIn(
      scopes: ['email', 'openid', 'profile'],
      serverClientId: apiServerClientId,
    );

    try {
      final result = await googleSignIn.signInSilently() ?? await googleSignIn.signIn();
      final googleAuth = await result!.authentication;
      final apiSignInResult = await SignInRepository.signIn(
        pinCode: auth.pinCode,
        idToken: googleAuth.idToken!,
      );

      await setAuth(
        authToken: apiSignInResult.data!.authToken,
        lastLogin: apiSignInResult.data!.user.lastSignedInAt,
      );

      LogUtility.info(
        tag: 'AuthService.relogin',
        message: 'Success relogin',
      );
      return true;
    } catch (exception, stackTrace) {
      LogUtility.error(
        tag: 'AuthService.relogin',
        message: 'Error ${exception.toString()}',
        stackTrace: stackTrace,
      );
      return false;
    }
  }
}
