import 'package:flutter/material.dart';
import 'package:shafi_app/main.dart';
import 'package:shafi_app/localization/localication-methods.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _expanded = false;
  String dropdownValue ;
  Locale _tempLocal;
  //TextEditingController _controller=TextEditingController();
  //List<String> items=['One', 'Two', 'Free', 'Four'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocaleDataFromStorage().then((getLocale) {
      setState(() {
        this.dropdownValue=getLocale.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      appBar: AppBar(
        title: Text(getTextTranslated(context, 'settings')),
      ),
      body: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: _expanded ? 160 : 80,
            //height: 80,
            width: double.infinity,
            margin: EdgeInsets.all(15.0),
            child: Card(
              elevation: 2,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.language_rounded,
                              color: Color(0xFF007AE7),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(getTextTranslated(context, 'language')),
                          ],
                        ),
                        IconButton(
                            icon: Icon(_expanded
                                ? Icons.expand_less
                                : Icons.expand_more),
                            onPressed: () {
                              setState(() {
                                _expanded = !_expanded;
                              });
                            }),
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    height: _expanded ? 50 : 0,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 35),
                      width: double.infinity,
                      child: DropdownButton<String>(
                        value: dropdownValue=='en' ? getTextTranslated(context, 'english'):getTextTranslated(context, 'arabic'),
                        isExpanded: true,
                        icon: Icon(
                          Icons.expand_more,
                          color: Color(0xFF007AE7),
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.black),
                        underline: Container(
                          height: 1,
                          color: Color(0xFF007AE7),
                        ),
                        onChanged: (String newValue) async{
                          setState(() {
                            newValue==getTextTranslated(context, 'english') ? dropdownValue = 'en':dropdownValue = 'ar';
                          });
                          _tempLocal = await setLocaleDataToStorage(dropdownValue);
                          MyApp.setLocale(context, _tempLocal);
                        },
                        items: <String>[getTextTranslated(context, 'english'), getTextTranslated(context, 'arabic')]
                            .map<DropdownMenuItem<String>>((newValue) {
                          return DropdownMenuItem<String>(
                            value: newValue,
                            child: Text(newValue),
                          );
                        }).toList(),
                      ),
                      // child: TextField(
                      //   controller: _controller,
                      //   decoration: InputDecoration(
                      //     suffixIcon: PopupMenuButton<String>(
                      //       icon: const Icon(Icons.arrow_drop_down),
                      //       onSelected: (String value) {
                      //         _controller.text = value;
                      //       },
                      //       itemBuilder: (BuildContext context) {
                      //         return items
                      //             .map<PopupMenuItem<String>>((String value) {
                      //           return new PopupMenuItem(
                      //               child: new Text(value), value: value);
                      //         }).toList();
                      //       },
                      //     ),
                      //   ),
                      // ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
