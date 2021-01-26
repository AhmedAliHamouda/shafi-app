import 'package:flutter/material.dart';
import 'package:shafi_app/localization/localication-methods.dart';
import 'package:shafi_app/screens/auth_screen.dart';
import 'package:shafi_app/widgets/verification_widget.dart';


class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(getTextTranslated(context, 'Active_phone_number'),),centerTitle: true,elevation: 0.0,),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height*0.89,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    color: Color(0xFF007AE7),
                    height: 60,
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
              // Positioned(
              //   top: 30,
              //   left: 10,
              //   child: Container(
              //     alignment: Alignment.topLeft,
              //     child: IconButton(icon: Icon(Icons.arrow_back,size: 30,color: Colors.white,), onPressed: (){
              //       Navigator.pushReplacement(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => AuthScreen(),
              //         ),
              //       );
              //     }),
              //   ),
              // ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: VerificationWidget(),
              ),
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AuthScreen(),));
                    },
                    child: Text(getTextTranslated(context, 'back_to_login'),style: TextStyle(color: Color(0xFF007AE7),),),
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
