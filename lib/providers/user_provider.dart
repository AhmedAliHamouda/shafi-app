
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shafi_app/models/user.dart';

class UserProvider extends ChangeNotifier{

    UserAuth _userAuthData;

  void setUserData(UserAuth userAuth){
    _userAuthData=userAuth;
    print(_userAuthData.firstName);
    print(_userAuthData.lastName);
    print(_userAuthData.email);
    notifyListeners();
  }

  Future<void> addUser()async{
    FirebaseFirestore fireStore=FirebaseFirestore.instance;
    fireStore.collection('users').doc(_userAuthData.phoneNumber).set(
        {
          'id':_userAuthData.id,
          'first_name':_userAuthData.firstName,
          'last_name':_userAuthData.lastName,
          'email':_userAuthData.email,
          'phone_number':_userAuthData.phoneNumber,
          'password':_userAuthData.password,
        });
    notifyListeners();
  }

  Future<String> getUserPass(String userNumber) async{
    FirebaseFirestore fireStore=FirebaseFirestore.instance;
    var data= await fireStore.collection('users').doc(userNumber).get();
     return data['password'];
  }


}