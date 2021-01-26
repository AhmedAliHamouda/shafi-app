import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shafi_app/localization/localication-methods.dart';

class NearestHospitals extends StatefulWidget {
  @override
  _NearestHospitalsState createState() => _NearestHospitalsState();
}

class _NearestHospitalsState extends State<NearestHospitals> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      //height: 120,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getTextTranslated(context, 'nearest_hospitals'),
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF007AE7),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                getTextTranslated(context, 'view_all'),
                style: TextStyle(
                    fontSize: 13,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  width: 280,
                  child: Card(
                    elevation: 5,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 80,
                          color: Color(0xFFFBFBFB),
                          child: Icon(Icons.image_outlined,size: 40,),
                        ),
                        Container(
                          margin: EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                getTextTranslated(context, 'city'),
                                style: TextStyle(color: Colors.black,fontSize: 10.0),
                              ),
                              Text(
                                getTextTranslated(context, 'name_hospital'),
                                style: TextStyle(color: Color(0xFF707070),fontSize: 12.0),
                              ),
                              Text(
                                getTextTranslated(context, 'specialties'),
                                style: TextStyle(color: Color(0xFF707070),fontSize: 10.0),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEBEBEB),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: FittedBox(
                                          child: Text(
                                            getTextTranslated(context, 'way'),style: TextStyle(fontSize: 12.0),)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
