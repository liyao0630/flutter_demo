import 'package:flutter/material.dart';
import 'package:protect_dev/common/bottomNavigation.dart';
import '../page/myApp.dart';
import '../page/Content_page.dart';

// Flutter中的路由管理和原生开发类似，无论是Android还是iOS，导航管理都会维护一个路由栈，路由入栈(push)操作对应打开一个新页面，路由出栈(pop)操作对应页面关闭操作，而路由管理主要是指如何来管理路由栈。

Map<String, WidgetBuilder> routers = {
  '/content': (context) {
    // 跳转路由并传递参数 Navigator.of(context).pushNamed("new_page", arguments: "hi");
    // 跳转获取参数 MyStatefulWidget(text: ModalRoute.of(context).settings.arguments);
    // page build方法获取路由参数 var args=ModalRoute.of(context).settings.arguments;

    // 通过路由名跳转 Navigator.pushNamed(context, "/");
    return ContentPage();
  },
  '/': (context) {
    // 跳转路由并传递参数 Navigator.of(context).pushNamed("new_page", arguments: "hi");
    // 跳转获取参数 MyStatefulWidget(text: ModalRoute.of(context).settings.arguments);
    // page build方法获取路由参数 var args=ModalRoute.of(context).settings.arguments;

    // 通过路由名跳转 Navigator.pushNamed(context, "/");
    return MyAppWidget(
      activeIndex: 0,
      bottomNavigation: [
        BottomNavigation(text: '推荐', icon: Icon(Icons.home)),
        BottomNavigation(text: '赛事', icon: Icon(Icons.business)),
        BottomNavigation(text: '资讯', icon: Icon(Icons.note)),
        BottomNavigation(text: '视频', icon: Icon(Icons.video_library)),
        BottomNavigation(text: '我的', icon: Icon(Icons.people)),
      ],
    );
  }
};

// 导航到没有配置router的路由
// Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) {
//       return MyStatefulWidget();
//   })
// );
