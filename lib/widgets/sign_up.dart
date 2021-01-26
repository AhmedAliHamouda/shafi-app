import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shafi_app/localization/localication-methods.dart';
import 'package:shafi_app/models/user.dart';
import 'package:shafi_app/providers/auth_provider.dart';
import 'package:shafi_app/providers/user_provider.dart';
import 'package:shafi_app/screens/verification_screen.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _passwordVisible = false;

  String firstName;
  String lastName;
  String email;
  String userNumber;
  String password;
  UserAuth userAuth;
  @override
  Widget build(BuildContext context) {
    final authProviderData = Provider.of<AuthProvider>(context, listen: false);
    final userProviderData = Provider.of<UserProvider>(context);

    return Column(
      children: [
        Container(
          child: Text(
            getTextTranslated(context, 'create_account'),
            style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          margin: EdgeInsets.only(bottom: 8),
        ),
        Container(
          height: 172,
          width: 126,
          child: Image.asset('images/Shafi_icon2.png'),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
          width: double.infinity,
          child: Material(
            elevation: 2.0,
            color: Color(0xFF007AE7),
            borderRadius: BorderRadius.circular(10.0),
            child: MaterialButton(
              onPressed: () {},
              //minWidth: 145,
              height: 38,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.facebookF,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FittedBox(
                    child: Text(
                      getTextTranslated(context, 'create_with_fb'),
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  left: 25.0,
                  right: 25.0,
                ),
                child: TextField(
                  onChanged: (val1) {
                    firstName = val1;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xFF007AE7),
                      size: 25,
                    ),
                    hintText: getTextTranslated(context, 'first_name'),
                    contentPadding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  right: 25.0,
                  left: 25.0,
                ),
                child: TextField(
                  onChanged: (val2) {
                    lastName = val2;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xFF007AE7),
                      size: 25,
                    ),
                    hintText: getTextTranslated(context, 'last_name'),
                    contentPadding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            onChanged: (val3) {
              email = val3;
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.mail,
                color: Color(0xFF007AE7),
                size: 30,
              ),
              hintText: getTextTranslated(context, 'email'),
              contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            onChanged: (valNumber) {
              setState(() {
                userNumber = '+2'+valNumber;
              });
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.phone_android,
                color: Color(0xFF007AE7),
                size: 30,
              ),
              //errorText: userNumber== null ? 'please enter phone number ':null,
              hintText: getTextTranslated(context, 'phone_number'),
              contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            onChanged: (valPassword) {
              password = valPassword;
            },
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
              hintText: getTextTranslated(context, 'password'),
              contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xFF007AE7),
                size: 30,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
            alignment: Alignment.centerLeft,
            child: Text.rich(
              TextSpan(
                text: getTextTranslated(context, 'terms1'),
                style: TextStyle(fontSize: 12.0),
                children: [
                  TextSpan(
                    text: getTextTranslated(context, 'terms2'),
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
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
          width: double.infinity,
          child: Material(
            elevation: 2.0,
            color: Color(0xFF007AE7),
            borderRadius: BorderRadius.circular(10.0),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerificationScreen(),
                    ));

                if (userNumber != null && password !=null) {
                  authProviderData.verifyNumber(userNumber);
                  userAuth = UserAuth(
                    id: DateTime.now().toIso8601String(),
                    firstName: firstName,
                    lastName: lastName,
                    email: email,
                    phoneNumber: userNumber,
                    password: password,
                  );
                  userProviderData.setUserData(userAuth);
                  print(userNumber);
                }
              },
              //minWidth: 145,
              height: 38,
              child: Text(
                getTextTranslated(context, 'create_account'),
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
