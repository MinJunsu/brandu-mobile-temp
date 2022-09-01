

import 'package:flutter_config/flutter_config.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInAPI {
  static final _googleSignIn = GoogleSignIn(clientId: FlutterConfig.get('GOOGLE_CLIENT_ID'));

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
}