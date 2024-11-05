
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/presentation/pages/otp_screen.dart';
import 'package:my_app/presentation/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends ChangeNotifier {
  bool _isSignedIn = false;

  bool get isSignedIn => _isSignedIn;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthProvider() {
    checkSign();
  }

  void checkSign() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool("is_signedin") ?? false;
    notifyListeners();
  }

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
          verificationCompleted:
              (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException ex) {},
          codeSent: (String verificationId, int? resendtoken) {
            Navigator.push(
              context, MaterialPageRoute(
              builder: (context) => OtpScreen(verificationId: verificationId),
            ),
            );
          },
          codeAutoRetrievalTimeout: (verificationId) {});
    }
    on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
    }
  }
}