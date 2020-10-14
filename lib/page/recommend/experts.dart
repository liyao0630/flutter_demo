import 'package:flutter/material.dart';

class Experts extends StatefulWidget {
  @override
  _ExpertsState createState() => _ExpertsState();
}

class _ExpertsState extends State<Experts> with SingleTickerProviderStateMixin {
  List<String> _tabs = [];
  int _tabIndex;

  TabController _innerTabController;

  @override
  void initState() {
    super.initState();
    print('init');
    _tabs = ['关注', '连红榜', '高回报', '命中率', '全部专家'];
    _tabIndex = 2;
    _innerTabController = TabController(
        length: _tabs.length, vsync: this, initialIndex: _tabIndex);
  }

  @override
  void dispose() {
    _innerTabController.dispose();
    super.dispose();
  }

  void _changeTabIndex(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  List<Widget> _createdTabs() {
    List<Widget> tabs = [];
    for (var i = 0; i < this._tabs.length; i++) {
      tabs.add(Tab(text: _tabs[i]));
    }
    return tabs;
  }

  Widget _setTabView() {
    List<Widget> list = [
      ListView.builder(
          // key: PageStorageKey('0'),
          itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text('child0 $index'));
      }),
      ListView.builder(
          // key: PageStorageKey('1'),
          itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text('child1 $index'));
      }),
      ListView.builder(
          key: PageStorageKey('2'),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text('child2 $index'));
          }),
      SingleChildScrollView(
        child: Text('1sf sfs  sf23423 23432 ' * 2000),
      ),
      Text('2sf sfs  sf23423 23432 ' * 2000),
    ];
    return list[_tabIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Colors.grey, style: BorderStyle.solid, width: 1))),
          child: TabBar(
            controller: _innerTabController,
            indicatorColor: Colors.red,
            indicatorPadding: EdgeInsets.only(left: 20, right: 20),
            labelPadding: EdgeInsets.zero,
            labelColor: Colors.red,
            labelStyle: TextStyle(fontSize: 16),
            unselectedLabelColor: Colors.black,
            tabs: _createdTabs(),
            onTap: _changeTabIndex,
          ),
        ),
        Expanded(child: _setTabView())
        // Expanded(
        //     child: TabBarView(
        //   controller: _innerTabController,
        //   children: <Widget>[
        //     ListView.builder(
        //         // key: PageStorageKey('0'),
        //         itemBuilder: (BuildContext context, int index) {
        //       return ListTile(title: Text('child0 $index'));
        //     }),
        //     ListView.builder(
        //         // key: PageStorageKey('1'),
        //         itemBuilder: (BuildContext context, int index) {
        //       return ListTile(title: Text('child1 $index'));
        //     }),
        //     ListView.builder(
        //         key: PageStorageKey('2'),
        //         itemBuilder: (BuildContext context, int index) {
        //           return ListTile(title: Text('child2 $index'));
        //         }),
        //     SingleChildScrollView(
        //       child: Text('1sf sfs  sf23423 23432 ' * 2000),
        //     ),
        //     Text('2sf sfs  sf23423 23432 ' * 2000),
        //   ],
        // ))
      ],
    );
  }
}
