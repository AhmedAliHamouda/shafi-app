import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shafi_app/localization/localication-methods.dart';
import 'package:shafi_app/providers/auth_provider.dart';
import 'package:shafi_app/providers/user_provider.dart';
import 'package:shafi_app/screens/full_home_screen.dart';
import 'package:shafi_app/widgets/loading_widget.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  String phoneNumber;
  String userPassword;
  bool isLoading=false;
  bool passWrong=false;
  bool phoneNumberWrong=false;
  String _locale;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocaleDataFromStorage().then((getLocale) {
      setState(() {
        this._locale=getLocale.toString();
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    final providerMethods=Provider.of<AuthProvider>(context,listen: false);
    final userProvider=Provider.of<UserProvider>(context,listen: false);
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            getTextTranslated(context,'login'),
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
          margin: EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            onChanged: (val){
              phoneNumber=val;
              //print(phoneNumber);
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.phone_android,
                color: Color(0xFF007AE7),
                size: 30,
              ),
              errorText:  phoneNumberWrong ? 'Wrong Number':null,
              hintText: getTextTranslated(context,'phone_number'),
              contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            obscureText: true,
            onChanged: (val){
              userPassword=val;
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xFF007AE7),
                size: 30,
              ),
              errorText:  passWrong ? 'Wrong Password':null,
              hintText: getTextTranslated(context,'password'),
              contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
            ),
          ),
        ),
        Container(
          alignment:_locale=='en' ?  Alignment.centerLeft: Alignment.centerRight,
          margin: EdgeInsets.symmetric(horizontal: 25.0,vertical: 5.0),
          child: Text(getTextTranslated(context,'forget_pass'),),
        ),
        SizedBox(height: 20,),
        if(isLoading)
          CircularProgressIndicator()
        else
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40.0),
          width: double.infinity,
          child: Material(
            elevation: 2.0,
            color: Color(0xFF007AE7),
            borderRadius: BorderRadius.circular(10.0),
            child: MaterialButton(
              onPressed: ()async{
                FocusScope.of(context).unfocus();
                setState(() {
                  isLoading=true;
                });
                if(phoneNumber!=null && userPassword!=null) {

                  bool dataNumber=await providerMethods.signIn(phoneNumber);
                  if(dataNumber){
                    String userPass= await userProvider.getUserPass(phoneNumber);
                    if(userPassword==userPass){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullHomeScreen(),
                          ),
                        );
                    }else{
                      setState(() {
                        passWrong=true;
                        isLoading=false;
                      });
                    }

                  }else{
                    setState(() {
                      phoneNumberWrong=true;
                      isLoading=false;
                    });
                  }


                }else{
                  setState(() {
                    passWrong=true;
                    phoneNumberWrong=true;
                    isLoading=false;
                  });
                }


                // if(phoneNumber.isNotEmpty){
                //   await providerMethods.signIn(phoneNumber).then((value) {
                //     if(value== false){
                //       setState(() {
                //         phoneNumberWrong=true;
                //         isLoading=false;
                //         return;
                //       });
                //     }
                //   });
                // }
                //
                // String userPass= await userProvider.getUserPass(phoneNumber);
                //
                // if(userPassword!=userPass || userPassword.isEmpty) {
                //   setState(() {
                //     passWrong=true;
                //     isLoading=false;
                //     return;
                //   });
                // }
                // if(userPassword==userPass){
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => HomeScreen(),
                //     ),
                //   );
                // }

              },
              //minWidth: 145,
              height: 38,
              child: Text(
                getTextTranslated(context,'login'),
                style: TextStyle(color: Colors.white,fontSize: 18.0,),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
           margin: EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Divider(thickness: 1,color: Colors.black54,)),
              Text(getTextTranslated(context, 'or'),style: TextStyle(fontSize: 14.0),),
              Expanded(child: Divider(thickness: 1,color: Colors.black54,)),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40.0),
          width: double.infinity,
          child: Material(
            elevation: 2.0,
            color: Color(0xFF007AE7),
            borderRadius: BorderRadius.circular(10.0),
            child: MaterialButton(
              onPressed: () async{
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoadingWidget(),
                  ),
                );


              },
              //minWidth: 145,
              height: 38,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.facebookF,color: Colors.white,),
                  SizedBox(width: 10,),
                  Text(
                    getTextTranslated(context,'log_with_fb'),
                    style: TextStyle(color: Colors.white,fontSize: 18.0),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40.0,vertical: 10.0),
          width: double.infinity,
          child: Material(
            elevation: 2.0,
            color: Color(0xFF007AE7),
            borderRadius: BorderRadius.circular(10.0),
            child: MaterialButton(
              onPressed: (){
                    Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullHomeScreen(),
                  ),
                );
              },
              //minWidth: 145,
              height: 38,
              child: Text(
                getTextTranslated(context,'skip_entry'),
                style: TextStyle(color: Colors.white,fontSize: 18.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
