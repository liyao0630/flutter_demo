import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../store/recommendModel.dart';

import 'scheme.dart';
import 'experts.dart';
import 'free.dart';

class Recommend extends StatefulWidget {
  Recommend({Key key}) : super(key: key);

  @override
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // RecommendModel recommendData = Provider.of<RecommendModel>(context);
    void changeTabIndex(int index) {
      print(index);
      // recommendData.tabIndexAction(index);
      _tabController.index = index;
    }

    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            shadowColor: Colors.transparent,
            bottom: PreferredSize(
                child: Row(children: [
                  Container(
                      width: 250,
                      alignment: Alignment.topLeft,
                      child: TabBar(
                        controller: _tabController,
                        labelPadding: EdgeInsets.only(top: 5, bottom: 5),
                        indicator: const BoxDecoration(),
                        labelStyle: TextStyle(fontSize: 20, color: Colors.white
                            // height: 20
                            ),
                        unselectedLabelStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        tabs: [
                          Text('方案'),
                          Text('专家'),
                          Text('免费'),
                        ],
                      ))
                ]),
                preferredSize: Size(260.0, 40)),
          ),
          preferredSize: Size.fromHeight(40)),
      body: TabBarView(controller: _tabController, children: [
        Scheme(changeTabIndex: changeTabIndex),
        Experts(),
        Free(),
      ]),
    );
  }
}
