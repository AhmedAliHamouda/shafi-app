import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shafi_app/localization/localication-methods.dart';
import 'package:shafi_app/screens/auth_screen.dart';

class LandScreen extends StatefulWidget {
  @override
  _LandScreenState createState() => _LandScreenState();
}

class _LandScreenState extends State<LandScreen> {
  int index = 0;
  List imageLandScreen = [
    'images/ls_1.png',
    'images/ls_2.png',
    'images/ls_3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 14, top: 6),
              height: 38.0,
              width: 51.0,
              child: FlatButton(
                //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthScreen(),
                    ),
                  );
                },
                child: Text(
                  getTextTranslated(context, 'skip'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                      height: 400,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      child: Image.asset(
                        'images/ls_icon.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 25,
                      child: Container(
                        margin: EdgeInsets.only(left: 39.55, right: 55.0),
                        width: 310.49,
                        height: 378.9,
                        child: Image.asset(
                          imageLandScreen[index],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  height: 32,
                  width: 174,
                  child: Text(
                    getTextTranslated(context, 'main_body_text'),
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  width: 349,
                  height: 84,
                  child: Text(
                    getTextTranslated(context, 'body_text'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                DotsIndicator(
                  decorator: DotsDecorator(
                      size: Size.square(12.0), activeSize: Size.square(12.0)),
                  dotsCount: 3,
                  position: index.toDouble(),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Material(
                    elevation: 2.0,
                    color: Color(0xFF007AE7),
                    borderRadius: BorderRadius.circular(10.0),
                    child: MaterialButton(
                      onPressed: () {
                        if (index <= 1) {
                          setState(() {
                            index++;
                          });
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AuthScreen(),
                            ),
                          );
                        }
                      },
                      minWidth: 145,
                      height: 38,
                      child: Text(
                        index==2 ? getTextTranslated(context, 'start_button'):getTextTranslated(context, 'next_button'),
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                ),

                index == 0
                    ? Container()
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Material(
                          elevation: 2,
                          color: Color(0xFF007AE7),
                          borderRadius: BorderRadius.circular(10.0),
                          child: MaterialButton(
                            onPressed: () {
                              if (index >= 1) {
                                setState(() {
                                  index--;
                                });
                              }
                            },
                            minWidth: 145,
                            height: 38,
                            child: Text(
                              getTextTranslated(context, 'previous_button'),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                          ),
                        ),
                      ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
