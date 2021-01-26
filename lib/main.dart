import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shafi_app/providers/auth_provider.dart';
import 'package:shafi_app/providers/user_provider.dart';
import 'package:shafi_app/screens/splash_screen.dart';

import 'localization/localication-methods.dart';
import 'localization/set-localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  static void setLocale(BuildContext context,Locale locale){
    _MyAppState state=context.findAncestorStateOfType<_MyAppState>();
    state.setLocaleApp(locale);
  }

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocaleDataFromStorage().then((getLocale) {
      setState(() {
        this._locale=getLocale;
      });
    });

  }
  void setLocaleApp(Locale locale){
    setState(() {
      _locale=locale;
    });
  }



  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_)=>AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_)=>UserProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xFF007AE7),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'JannaLT',
        ),
        home: SplashScreen(),
        locale: _locale,
        supportedLocales: [
          Locale('en',''),
          Locale('ar',''),
        ],
        localizationsDelegates: [
          SetLocalization.localizationsDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}
