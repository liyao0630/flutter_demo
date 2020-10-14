import 'package:flutter/material.dart';
import 'package:protect_dev/store/recommendModel.dart';
import 'package:provider/provider.dart';

import 'recommend/index.dart';
import 'Home1.dart';
import 'Home2.dart';
import 'Home.dart';

class MyAppWidget extends StatefulWidget {
  MyAppWidget({Key key, this.activeIndex = 0}) : super(key: key);

  final int activeIndex;

  @override
  _MyAppWidgetState createState() => _MyAppWidgetState();
}

class _MyAppWidgetState extends State<MyAppWidget>
    with SingleTickerProviderStateMixin {
  int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.activeIndex;
  }

  Widget _selectPage() {
    Widget currentWidget = Home();
    switch (_selectedIndex) {
      case 0:
        currentWidget = Recommend();
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

  void _bottomNavigationBarTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RecommendModel()),
          ChangeNotifierProvider(create: (_) => Counter())
        ],
        child: Scaffold(
          appBar: PreferredSize(
              child: AppBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  shadowColor: Colors.transparent),
              preferredSize: Size.fromHeight(0)),
          body: _selectPage(),
          bottomNavigationBar: BottomNavigationBar(
            // 底部导航
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.stars_rounded), label: '推荐'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_events), label: '赛事'),
              BottomNavigationBarItem(icon: Icon(Icons.article), label: '资讯'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.video_collection), label: '视频'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
            ],
            currentIndex: _selectedIndex,
            fixedColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            selectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
            // @required this.items,
            // this.onTap,
            // this.currentIndex = 0,
            // this.elevation,
            // this.type,
            // Color fixedColor,
            // this.backgroundColor,
            // this.iconSize = 24.0,
            // Color selectedItemColor,
            // this.unselectedItemColor,
            // this.selectedIconTheme,
            // this.unselectedIconTheme,
            // this.selectedFontSize = 14.0,
            // this.unselectedFontSize = 12.0,
            // this.selectedLabelStyle,
            // this.unselectedLabelStyle,
            // this.showSelectedLabels = true,
            // this.showUnselectedLabels,
            // this.mouseCursor,
            onTap: _bottomNavigationBarTap,
          ),
        ));
  }
}
