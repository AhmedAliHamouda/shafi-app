import 'package:flutter/material.dart';
import 'package:shafi_app/localization/localication-methods.dart';
import 'package:shafi_app/screens/settings_screen.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          width: double.infinity,
          height: 120,
          child: Image.asset('images/Shafi_icon2.png'),
        ),
        item('images/Icon material-perm-device-information.png', getTextTranslated(context, 'about_app')),
        item('images/headphones.png', getTextTranslated(context, 'contact_us')),
        item('images/people.png', getTextTranslated(context, 'join')),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsScreen()));
          },
          child: item('images/settings.png', getTextTranslated(context, 'settings')),
        ),
      ],
    );
  }
}

Widget item(String imageData, String name) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
    child: Row(
      children: [
        CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25,
            child: Container(
              height: 25,
              width: 25,
              child: Image.asset(imageData),
            )),
        SizedBox(
          width: 20,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 18.0),
        ),
      ],
    ),
  );
}
