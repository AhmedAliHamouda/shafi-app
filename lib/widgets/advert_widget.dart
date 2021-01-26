import 'package:flutter/material.dart';
import 'package:shafi_app/localization/localication-methods.dart';

class AdvertWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.06,
            color: Colors.white,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset('images/Icon awesome-image.png'),
                  height: 40,
                  width: 60,
                ),
                SizedBox(height: 5,),
                Text(getTextTranslated(context, 'ad_place_here'),),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.06,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
