import 'package:flutter/material.dart';
import 'package:shafi_app/localization/localication-methods.dart';
import 'package:shafi_app/widgets/login.dart';
import 'package:shafi_app/widgets/sign_up.dart';

class AuthScreen extends StatefulWidget {
  
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLoginScreen = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    color: Color(0xFF007AE7),
                    height: 140,
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
              Positioned(
                top: 25,
                left: 0,
                right: 0,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 3),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: isLoginScreen ? LoginWidget() : SignUp()),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isLoginScreen = !isLoginScreen;
                      });
                    },
                    child: Text.rich(
                      TextSpan(
                        text: isLoginScreen
                            ? getTextTranslated(context, 'dont_have_account')
                            : getTextTranslated(context, 'have_account'),
                        style: TextStyle(fontSize: 12.0),
                        children: [
                          TextSpan(
                            text: isLoginScreen ? getTextTranslated(context, 'create_account') : getTextTranslated(context, 'login'),
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Theme.of(context).primaryColor,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
