import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shafi_app/screens/land_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LandScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF3DBCA7).withOpacity(0.5),
              Color(0xFF007AE7).withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0, 1],
          ),
        ),
        child: Stack(
          children: [

            Center(
              child:  Container(
                //margin: EdgeInsets.only(left: 1.0),
                height: 150.5,
                width: 110.84,
                child: Image.asset(
                  'images/sp_icon.png',
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                //margin: EdgeInsets.only(left: 1.0),
                width: 70.0,
                child: Image.asset(
                  'images/sp_left.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                //margin: EdgeInsets.only(left: 1.0),
                width: 70.0,
                child: Image.asset(
                  'images/sp_right.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
