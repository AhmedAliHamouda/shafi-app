import 'package:flutter/material.dart';
import 'package:shafi_app/localization/localication-methods.dart';

class DetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                height: 90,
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Image.asset('images/hospital-buildings.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                //width: MediaQuery.of(context).size.width * 0.25,
                child: FittedBox(
                  child: Text(getTextTranslated(context, 'hospitals'),),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                height: 90,
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Container(
                  padding: EdgeInsets.all(25.0),
                  child: Image.asset('images/Icon map-doctor.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                //width: MediaQuery.of(context).size.width * 0.25,
                child: FittedBox(
                  child: Text(getTextTranslated(context, 'doctor'),),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                height: 90,
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Container(
                  padding: EdgeInsets.all(20.0),

                  child: Image.asset('images/Group 207.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                //width: MediaQuery.of(context).size.width * 0.25,
                child: FittedBox(
                  child: Text(getTextTranslated(context, 'stimulant_medicines'),),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
