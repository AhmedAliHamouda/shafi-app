import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shafi_app/localization/localication-methods.dart';
import 'package:shafi_app/providers/auth_provider.dart';
import 'package:shafi_app/screens/auth_screen.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final providerMethods = Provider.of<AuthProvider>(context, listen: false);
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.symmetric(horizontal: 40.0,vertical: 10.0),
      width: double.infinity,
      child: Material(
        elevation: 2.0,
        color: Color(0xFF007AE7),
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
          onPressed: ()async{
             await providerMethods.logOutFromFacebook();
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AuthScreen(),));
          },
          //minWidth: 145,
          height: 38,
          child: Text(
            getTextTranslated(context,'logout'),
            style: TextStyle(color: Colors.white,fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
