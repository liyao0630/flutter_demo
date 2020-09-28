import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//定义需要共享的数据模型，通过混入ChangeNotifier管理听众
class RecommendModel with ChangeNotifier {
  int _tabIndex = 1;
  //读方法
  int get tabIndex => _tabIndex;
  //写方法
  void tabIndexAction(int index) {
    _tabIndex = index;
    notifyListeners(); //通知听众刷新
  }
}

class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
