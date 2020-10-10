import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  // Widget _createTab(TabController tabController) {
  //   return Column(
  //     children: [
  //       TabBar(controller: tabController, tabs: [
  //         Text('1',
  //             textAlign: TextAlign.center,
  //             style: TextStyle(color: Colors.black, height: 2, fontSize: 18)),
  //         Text('2',
  //             textAlign: TextAlign.center,
  //             style: TextStyle(color: Colors.black, height: 2, fontSize: 18)),
  //         Text('3',
  //             textAlign: TextAlign.center,
  //             style: TextStyle(color: Colors.black, height: 2, fontSize: 18)),
  //       ]),
  //       TabBarView(
  //         controller: tabController,
  //         children: [
  //           Text('1_' * 2000),
  //           Text('2_' * 2000),
  //           Text('3_' * 2000),
  //         ],
  //       )
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
          bottom: TabBar(
              //生成Tab菜单
              controller: _tabController,
              tabs: tabs.map((e) => Tab(text: e)).toList()),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                    child: SingleChildScrollView(
                        child: Text(
                            '购买实体书 Flutter中文网简介前言入门篇第一章：起步1.1：移动开发技术简介1.2：初识Flutter1.3：搭建Flutter开发环境1.4：Dart语言简介第二章：第一个Flutter应用2.1：计数器示例2.2：路由管理2.3：包管理2.4：资源管理2.5：调试Flutter APP2.6：Dart线程模型及异常捕获第三章：基础组件3.1：Widget简介3.2：状态管理3.3：文本、字体样式3.4：按钮3.5：图片和Icon3.6：单选框和复选框3.7：输入框和表单3.8：进度指示器第四章：布局类组件4.1：布局类组件简介4.2：线性布局（Row、Column）4.3：弹性布局（Flex）4.4：流式布局（Wrap、Flow）4.5：层叠布局（Stack、Positioned）4.6：对齐与相对定位（Align）第五章：容器类组件5.1：填充（Padding）5.2：尺寸限制类容器（ConstrainedBox等）5.3：装饰容器（DecoratedBox）5.4：变换（Transform）5.5：Container容器5.6：Scaffold、TabBar、底部导航5.7：剪裁（Clip）第六章：可滚动组件6.1：可滚动组件简介6.2：SingleChildScrollView6.3：ListView6.4：GridView6.5：CustomScrollView6.6：滚动监听及控制（ScrollController）第七章：功能型组件7.1：导航返回拦截（WillPopScope）7.2：数据共享（InheritedWidget）7.3： 跨组件状态共享（Provider）7.4：颜色和主题（Theme）7.5：异步UI更新（FutureBuilder、StreamBuilder）7.6：对话框详解进阶篇第八章：事件处理与通知8.1：原始指针事件处理8.2：手势识别8.3：全局事件总线8.4：通知(Notification)第九章：动画9.1：Flutter动画简介9.2：动画结构9.3：自定义路由过渡动画9.4：Hero动画9.5：交织动画9.6：通用“动画切换”组件（AnimatedSwitcher）9.7：动画过渡组件第十章：自定义组件10.1：自定义组件方法简介10.2：组合现有组件10.3：组合实例：TurnBox10.4：自绘组件（CustomPaint与Canvas）10.5：自绘实例：圆形渐变进度条(自绘)第十一章：文件操作与网络请求11.1：文件操作11.2：Http请求-HttpClient11.3：Http请求-Dio package11.4：实例：Http分块下载11.5：WebSocket11.6：使用Socket API11.7：Json转Dart Model类第十二章：包与插件12.1：开发package12.2：平台通道简介12.3：开发Flutter插件12.4：插件开发：实现Android端API12.5：插件开发：实现IOS端API12.6：Texture和PlatformView第十三章：国际化13.1：让App支持多语言13.2：实现Localizations13.3：使用Intl包13.4：国际化常见问题第十四章：Flutter核心原理14.1：Flutter UI系统14.2：Element和BuildContext14.3：RenderObject与RenderBox14.4：Flutter从启动到显示14.5：Flutter图片加载与缓存实例篇第十五章：一个完整的Flutter应用15.1：应用简介15.2：APP代码结构15.3：Model类定义15.4：全局变量及共享状态15.5：网络请求封装15.6：App入口及首页15.7：登录页15.8：多语言和多主题本书使用 GitBook 发布  5.6：Scaffold、TabBar、底部导航购买实体书5.6 Scaffold、TabBar、底部导航Material组件库提供了丰富多样的组件，本节介绍一些常用的组件，其余的读者可以自行查看文档或Flutter Gallery中Material组件部分的示例。Flutter Gallery是Flutter官方提供的Flutter Demo，源码位于flutter源码中的examples目录下，笔者强烈建议用户将Flutter Gallery示例跑起来，它是一个很全面的Flutter示例应用，是非常好的参考Demo，也是笔者学习Flutter的第一手资料。5.6.1 Scaffold一个完整的路由页可能会包含导航栏、抽屉菜单(Drawer)以及底部Tab导航菜单等。如果每个路由页面都需要开发者自己手动去实现这些，这会是一件非常麻烦且无聊的事。幸运的是，Flutter Material组件库提供了一些现成的组件来减少我们的开发任务。Scaffold是一个路由页的骨架，我们使用它可以很容易地拼装出一个完整的页面。示例我们实现一个页面，它包含：一个导航栏导航栏右边有一个分享按钮有一个抽屉菜单有一个底部导航右下角有一个悬浮的动作按钮最终效果如图5-18、图5-19所示： 实现代码如下：class ScaffoldRoute extends StatefulWi')))
              ],
            ),
            Text('sdfsdtdgh23453_' * 150),
            Text('dfghsdfgdfd4342_' * 100),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
