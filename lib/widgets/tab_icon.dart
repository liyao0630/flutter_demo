import 'package:flutter/material.dart';

class TabIconWidget extends StatefulWidget {
  TabIconWidget(
      {Key key,
      @required this.tabs,
      @required this.tabViews,
      this.tabIndex = 0})
      : super(key: key);

  final int tabIndex;
  final List<String> tabs;
  final List<Widget> tabViews;

  @override
  _TabIconWidgetState createState() => _TabIconWidgetState();
}

class _TabIconWidgetState extends State<TabIconWidget>
    with SingleTickerProviderStateMixin {
  List<String> _tabs;
  List<Widget> _tabViews;
  TabController _tabController;
  int _tabIndex;

  @override
  void initState() {
    super.initState();

    _tabIndex = widget.tabIndex;
    _tabs = widget.tabs;
    _tabViews = widget.tabViews;

    _tabController = TabController(vsync: this, length: _tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _indexChange(index) {
    setState(() {
      _tabIndex = index;
    });
  }

  Widget _getTabView() {
    return _tabViews[_tabIndex];
  }

  int getCurrentTabIndex() {
    return _tabController.index;
  }

  List<Widget> _createdTabs() {
    List<Widget> tabs = [];
    Color textColor = Colors.black;
    Color indicatorColor = Colors.transparent;
    String text;
    for (var i = 0; i < _tabs.length; i++) {
      text = _tabs[i];
      if (i == _tabIndex) {
        indicatorColor = textColor = Colors.red;
      } else {
        indicatorColor = Colors.transparent;
        textColor = Colors.black;
      }
      tabs.add(Column(
        children: [
          Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(color: textColor, height: 2, fontSize: 18)),
          Container(
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(
                    color: indicatorColor, style: BorderStyle.solid, width: 2)),
          ),
        ],
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Colors.grey,
                        style: BorderStyle.solid,
                        width: 1))),
            child: TabBar(
                onTap: (index) => {_indexChange(index)},
                controller: _tabController,
                indicatorWeight: 0.0,
                indicator: BoxDecoration(
                    border: Border(
                        bottom: BorderSide.none,
                        left: BorderSide.none,
                        right: BorderSide.none,
                        top: BorderSide.none)),
                tabs: _createdTabs())),
        Padding(
          padding: EdgeInsets.only(top: 6, right: 20, bottom: 10, left: 20),
          child: _getTabView(),
        )
      ],
    );
  }
}
