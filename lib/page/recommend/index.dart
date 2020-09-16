import 'package:flutter/material.dart';
import '../../widgets/tab_left.dart';
import 'scheme.dart';
import 'experts.dart';
import 'free.dart';

Widget getRecommend() {
  return TabLeftWidget(
    tabs: ['方案', '专家', '免费'],
    tabViews: [
      Scheme(),
      Experts(),
      Free(),
    ],
  );
}
