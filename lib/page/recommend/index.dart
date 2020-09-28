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

  void changeTabIndex(int index) {}

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.height);
    // Provider.of<RecommendModel>(context).tabIndex;
    return TabLeftWidget(
        tabIndex: Provider.of<RecommendModel>(context).tabIndex,
        tabs: ['方案', '专家', '免费'],
        tabViews: [
          Scheme(),
          Experts(),
          Free(),
        ],
        tabEvent: Provider.of<RecommendModel>(context).tabIndexAction);
  }
}
