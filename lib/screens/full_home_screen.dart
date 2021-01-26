
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shafi_app/localization/localication-methods.dart';
import 'package:shafi_app/providers/auth_provider.dart';
import 'package:shafi_app/screens/account_screen.dart';
import 'package:shafi_app/screens/home_screen.dart';
import 'package:shafi_app/screens/more_screen.dart';



class FullHomeScreen extends StatefulWidget {
  @override
  _FullHomeScreenState createState() => _FullHomeScreenState();
}

class _FullHomeScreenState extends State<FullHomeScreen> {

 final List<Widget> _pages=[
  HomeScreen(),
  Container(),
  AccountScreen(),
  MoreScreen()
];

 int _selectedPageIndex=0;

 void _selectedPage(int index){
   setState(() {
     _selectedPageIndex=index;
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      appBar: AppBar(
          automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 25,
              width: 25,
              child: Image.asset('images/Group 201.png'),
            ),
            Text(getTextTranslated(context, 'shafi'),),
          ],
        ),
        actions: [
          Icon(Icons.share),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.notifications),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).accentColor,
        type: BottomNavigationBarType.fixed,
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            title: Text(getTextTranslated(context, 'home_screen'),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text(getTextTranslated(context, 'search'),),
          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.person),
            title: Text(getTextTranslated(context, 'account'),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_outlined),
            title: Text(getTextTranslated(context, 'more'),),
          )
        ],
      ),
    );
  }
}
