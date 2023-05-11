import 'package:flutter/material.dart';
import 'package:git_sample/details_reports/entry_page.dart';
import 'package:git_sample/details_reports/reportpage.dart';

class FormScreenPage extends StatefulWidget {
  const FormScreenPage({Key? key}) : super(key: key);

  @override
  _FormScreenPageState createState() => _FormScreenPageState();
}

class _FormScreenPageState extends State<FormScreenPage> {
  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  int _selectIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    EntryPage(),
    ReportPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              _selectIndex == 0 ? "Entry" : "Report",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _widgetOptions.elementAt(_selectIndex),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.edit),
                    label: "Entry",
                    backgroundColor: Colors.cyan),
                BottomNavigationBarItem(
                    icon: Icon(Icons.wysiwyg),
                    label: 'Report',
                    backgroundColor: Colors.cyanAccent),
              ],
              type: BottomNavigationBarType.shifting,
              currentIndex: _selectIndex,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.black,
              iconSize: 40,
              onTap: _onItemTapped,
              elevation: 5),
        ));
  }
}
