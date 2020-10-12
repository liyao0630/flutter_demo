import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/tab_left.dart';
import 'scheme.dart';
import 'experts.dart';
import 'free.dart';
import '../../store/recommendModel.dart';

class Recommend extends StatefulWidget {
  Recommend({Key key}) : super(key: key);

  @override
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    RecommendModel recommendData = Provider.of<RecommendModel>(context);
    void changeTabIndex(int index) {
      recommendData.tabIndexAction(index);
    }

    return TabLeftWidget(
        tabIndex: recommendData.tabIndex,
        tabs: ['方案', '专家', '免费'],
        tabViews: [
          Scheme(changeTabIndex: changeTabIndex),
          Experts(),
          Free(),
        ],
        tabEvent: changeTabIndex);
  }
}
