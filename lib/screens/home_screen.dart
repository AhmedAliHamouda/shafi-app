import 'package:flutter/material.dart';
import 'package:shafi_app/localization/localication-methods.dart';
import 'package:shafi_app/widgets/advert_widget.dart';
import 'package:shafi_app/widgets/details_widget.dart';
import 'package:shafi_app/widgets/nearest_doctor_widget.dart';
import 'package:shafi_app/widgets/nearest_hospitals_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.06,
          //height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25.0),
              bottomLeft: Radius.circular(25.0),
            ),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  getTextTranslated(context, 'reminder_next_dose'),
                  style: TextStyle(color: Color(0xFF707070)),
                ),
                Row(
                  children: [
                    Text(
                      getTextTranslated(context, 'time'),
                      style: TextStyle(color: Color(0xFF007AE7)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.more_horiz,
                      color: Color(0xFF707070),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        AdvertWidget(),
        DetailsWidget(),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(
              thickness: 2,
            )),
        NearestDoctor(),
        NearestHospitals(),
        // FlatButton(
        //     onPressed: () {
        //       providerMethods.logOutFromFacebook();
        //       Navigator.pushReplacement(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => AuthScreen(),
        //         ),
        //       );
        //     },
        //     child: Text('Log Out')),
      ],
    );
  }
}
