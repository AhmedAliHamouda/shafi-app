import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shafi_app/providers/auth_provider.dart';
class LoadingWidget extends StatefulWidget {
  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

    startTime() async {
    var duration = new Duration(seconds: 1);
    return Timer(duration, route);
  }

    route() {
    AuthProvider.logInWithFacebook(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
