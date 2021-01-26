import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:shafi_app/screens/full_home_screen.dart';

class AuthProvider extends ChangeNotifier {
  String _verificationCode;

  String get verificationCode {
    return _verificationCode;
  }

  Future<void> verifyNumber(String number) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    final PhoneVerificationCompleted phoneVerificationCompleted =
        (AuthCredential authCredential) {
      print('verification');
      print('ur Verification when comp ${authCredential.signInMethod}');
    };

    final PhoneVerificationFailed phoneVerificationFailed =
        (FirebaseAuthException exception) {
      print('my exception ${exception.message}');
    };

    final PhoneCodeSent phoneCodeSent = (String verId, [int forceCodeResend]) {
      this._verificationCode = verId;
      print(_verificationCode);
    };
    final PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout =
        (String verId) {
      this._verificationCode = verId;
    };

    _auth.verifyPhoneNumber(
      phoneNumber: number,
      timeout: Duration(seconds: 30),
      verificationCompleted: (AuthCredential authCredential) {
        _auth.signInWithCredential(authCredential);
      },
      verificationFailed: (FirebaseAuthException exception) {
        return 'error';
      },
      codeSent: (String verId, [int forceCodeResend]) {
        _verificationCode = verId;
      },
      codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout,
    );
    notifyListeners();
  }

  Future<bool> signUpWithNumber(String smsCode, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      if (_verificationCode != null) {
        AuthCredential authCredential = PhoneAuthProvider.credential(
          verificationId: _verificationCode,
          smsCode: smsCode,
        );
        await _auth.signInWithCredential(authCredential);
        //return false;
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }

    // _auth.signInWithCredential(authCredential).then(
    //       (user) => Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => FullHomeScreen(),
    //         ),
    //       ),
    //     );
    notifyListeners();
  }

  Future<bool> signIn(String phoneNumber) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      String userPhoneNumber = _auth.currentUser.phoneNumber;
      print('my userPhoneNumberIs $userPhoneNumber');
      if (phoneNumber == userPhoneNumber) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print('my error Here=> ${error.toString()}');
      return error;
    }
  }

  //TODO: Test Method
  static Future<void> logInWithFacebook(BuildContext context) async {
    try {
      AccessToken accessToken = await FacebookAuth.instance.isLogged;

      if (accessToken == null) {
        await FacebookAuth.instance.login();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => FullHomeScreen(),
          ),
        );
        final facebookUserData = await FacebookAuth.instance.getUserData();
        print(facebookUserData);
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => FullHomeScreen(),
          ),
        );
        print(accessToken.isExpired);
      }
    } on FacebookAuthException catch (e) {
      switch (e.errorCode) {
        case FacebookAuthErrorCode.OPERATION_IN_PROGRESS:
          print("You have a previous login operation in progress");
          break;
        case FacebookAuthErrorCode.CANCELLED:
          print("login cancelled");
          break;
        case FacebookAuthErrorCode.FAILED:
          print("login failed");
          break;
      }
    }
  }

  Future<void> logOutFromFacebook() async {
    await FacebookAuth.instance.logOut();
    print('LogOut Successfully');
  }
}
