import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shafi_app/localization/localication-methods.dart';
import 'package:shafi_app/providers/auth_provider.dart';
import 'package:shafi_app/providers/user_provider.dart';
import 'package:shafi_app/screens/full_home_screen.dart';

class VerificationWidget extends StatefulWidget {
  @override
  _VerificationWidgetState createState() => _VerificationWidgetState();
}

class _VerificationWidgetState extends State<VerificationWidget> {
  String _smsCode;
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<AuthProvider>(context, listen: false);
    final userProviderData = Provider.of<UserProvider>(context, listen: false);
    return Column(
      children: <Widget>[
        // Container(
        //   child: Text(
        //     getTextTranslated(context, 'Active_phone_number'),
        //     style: TextStyle(
        //         fontSize: 22.0,
        //         color: Colors.white,
        //         fontWeight: FontWeight.bold),
        //   ),
        //   margin: EdgeInsets.only(bottom: 8),
        // ),
        Container(
          height: 172,
          width: 126,
          child: Image.asset('images/Shafi_icon2.png'),
        ),
        Container(
          margin:
              EdgeInsets.only(left: 25.0, right: 50.0, top: 20.0, bottom: 20.0),
          child: Text(
            getTextTranslated(context, 'verify_page_text'),
            style: TextStyle(
              fontSize: 18.0,
              //color: Color(0xFF3A3A3A),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            onChanged: (val) {
              _smsCode = val;
            },
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintStyle: TextStyle(letterSpacing: 15.0, fontSize: 22.0),
              hintText: '****',
              contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            ),
          ),
        ),
        if (isLoading)
          Container(
              margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
              child: CircularProgressIndicator())
        else
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
            width: double.infinity,
            child: Material(
              elevation: 2.0,
              color: Color(0xFF007AE7),
              borderRadius: BorderRadius.circular(10.0),
              child: MaterialButton(
                splashColor: Colors.grey,
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  setState(() {
                    isLoading = true;
                  });
                  if(_smsCode!=null){
                    await providerData.signUpWithNumber(_smsCode, context).then((value) {

                      if(value){
                        userProviderData.addUser().then((value) {
                          setState(() {
                            isLoading = false;
                          });
                        });
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullHomeScreen(),
                          ),
                        );
                      }else
                        {
                          setState(() {
                            isLoading=false;
                          });
                        }
                    });

                  } else{
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                //minWidth: 145,
                height: 38,
                child: Text(
                  getTextTranslated(context, 'verify'),
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
          ),
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
            alignment: Alignment.center,
            child: Text.rich(
              TextSpan(
                text: getTextTranslated(context, 'code1'),
                style: TextStyle(fontSize: 16.0),
                children: [
                  TextSpan(
                    text: getTextTranslated(context, 'code2'),
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
