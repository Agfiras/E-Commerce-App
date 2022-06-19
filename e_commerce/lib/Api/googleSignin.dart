import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninApi {
  static final _googleSignIN = GoogleSignIn();

  static Future login() => _googleSignIN.signIn();
}
