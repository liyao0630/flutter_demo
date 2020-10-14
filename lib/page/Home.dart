import 'package:flutter/material.dart';
// import 'package:protect_dev/page/test.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'defalut'),
    Tab(text: 'RIGHT2'),
    Tab(text: 'RIGHT3'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              shadowColor: Colors.transparent,
              bottom: TabBar(
                controller: _tabController,
                tabs: [
                  Text('方案'),
                  Text('专家'),
                  Text('免费'),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(30)),
        body: TabBarView(
          controller: _tabController,
          children: [
            Text('1sf sfs  sf23423 23432 ' * 2000),
            Text('2sf sfs  sf23423 23432 ' * 2000),
            Text('3sf sfs  sf23423 23432 ' * 2000),
          ],
        ));
  }
}
