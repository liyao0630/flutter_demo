import 'package:flutter/material.dart';

class TabLeftWidget extends StatefulWidget {
  TabLeftWidget(
      {Key key,
      @required this.tabs,
      @required this.tabViews,
      this.tabIndex = 0,
      this.tabEvent,
      this.activeTextStyle = const TextStyle(color: Colors.white, fontSize: 20),
      this.textStyle = const TextStyle(color: Colors.white),
      this.activeBoxDecoration})
      : super(key: key);

  final int tabIndex;
  final Function tabEvent;
  final List<String> tabs;
  final List<Widget> tabViews;
  final TextStyle activeTextStyle;
  final TextStyle textStyle;
  final BoxDecoration activeBoxDecoration;

  @override
  _TabLeftWidgetState createState() => _TabLeftWidgetState();
}

class _TabLeftWidgetState extends State<TabLeftWidget>
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
    _tabController = TabController(vsync: this, length: _tabs.length)
      ..addListener(() {
        _indexChange(_tabController.index);
      });
    _tabController.index = _tabIndex;
    // _tabController.
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _indexChange(index) {
    if (widget.tabEvent != null) {
      widget.tabEvent(index);
    }
    setState(() {
      _tabIndex = index;
    });
  }

  List<Widget> _createdTabs() {
    List<Widget> tabs = [];
    Widget tab;
    for (var i = 0; i < _tabs.length; i++) {
      if (i == _tabIndex) {
        tab = Text(_tabs[i], style: widget.activeTextStyle);
      } else {
        tab = Text(_tabs[i], style: widget.textStyle);
      }
      tabs.add(Tab(child: tab));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: Theme.of(context).primaryColor,
          child: Row(
            children: [
              Container(
                width: 260,
                height: 50,
                child: TabBar(
                    controller: _tabController,
                    tabs: _createdTabs(),
                    indicatorColor: Colors.transparent),
              )
            ],
          ),
        ),
        Expanded(
            child: TabBarView(
          controller: _tabController,
          children: _tabViews,
        ))
      ],
    );
  }
}
