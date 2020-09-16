import 'package:flutter/material.dart';
import 'package:protect_dev/common/bottomNavigation.dart';

import 'recommend/index.dart';
import 'Home1.dart';
import 'Home2.dart';
import 'Home.dart';

class MyAppWidget extends StatefulWidget {
  MyAppWidget({Key key, this.bottomNavigation, this.activeIndex})
      : super(key: key);

  final List<BottomNavigation> bottomNavigation;
  final int activeIndex;

  @override
  _MyAppWidgetState createState() => _MyAppWidgetState();
}

class _MyAppWidgetState extends State<MyAppWidget> {
  int _selectedIndex = 0;
  List<BottomNavigation> _navigations = [];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.activeIndex;
    _navigations = widget.bottomNavigation;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _selectPage() {
    Widget currentWidget = Home();
    switch (_selectedIndex) {
      case 0:
        currentWidget = getRecommend();
        break;
      case 1:
        currentWidget = Home1();
        break;
      case 2:
        currentWidget = Home2();
        break;
      default:
    }
    return currentWidget;
  }

  Expanded _bottomBtn(BuildContext context, BottomNavigation config, int index,
      Function changeEvent) {
    Color textColor = Colors.grey;
    if (index == _selectedIndex) {
      textColor = Theme.of(context).primaryColor;
    }
    return Expanded(
        child: FlatButton(
            textColor: textColor,
            color: Colors.transparent,
            child: Column(
              children: [config.icon, Text(config.text)],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              changeEvent(index);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              shadowColor: Colors.transparent),
          preferredSize: Size.fromHeight(0)),
      body: SafeArea(
          child: Container(
              child: Column(children: [
        Expanded(child: _selectPage()),
        Row(
          children: [
            for (int i = 0; i < _navigations.length; i++)
              _bottomBtn(context, _navigations[i], i, _onItemTapped)
          ],
        )
      ]))),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: _selectPage(),
  //     ),
  //     bottomNavigationBar: BottomNavigationBar(
  //         items: const <BottomNavigationBarItem>[
  //           BottomNavigationBarItem(
  //             icon: Icon(Icons.home),
  //             title: Text('Home'),
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Icon(Icons.business),
  //             title: Text('Business'),
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Icon(Icons.school),
  //             title: Text('School'),
  //           ),
  //         ],
  //         currentIndex: _selectedIndex,
  //         selectedItemColor: Colors.black,
  //         // selectedItemColor: Colors.amber[800],
  //         onTap: _onItemTapped,
  //         selectedFontSize: 12),
  //   );
  // }
}
