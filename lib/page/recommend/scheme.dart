import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import '../../widgets/banner.dart';
import '../../widgets/tab_icon.dart';
import '../../widgets/tab_list.dart';

class Scheme extends StatefulWidget {
  Scheme({Key key, this.changeTabIndex}) : super(key: key);
  final Function changeTabIndex;
  @override
  _SchemeState createState() => _SchemeState();
}

class _SchemeState extends State<Scheme> with TickerProviderStateMixin {
  bool loadTopState = false;
  bool loadBottomState = false;
  int listLength = 300;
  int listPage = 0;
  int listSize = 10;
  TabListWidget contentIconWidget;
  List<String> _expertTabs = ['足球专家', '篮球专家'];
  List<String> _contentTabs = ['全部', '足球', '篮球'];
  int _contentTabsIndex = 0;
  List<Map<String, String>> _footballExpertData;
  List<Map<String, String>> _basketballExpertData;
  List<Widget> _scrollList0 = [];
  List<Widget> _scrollList1 = [];
  List<Widget> _scrollList2 = [];
  List<String> _bannerPath;
  // double _mainHeight;
  ScrollController _controller;

  double winWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()
      ..addListener(() {
        // 顶部状态管理
        var offset = _controller.offset;
        // print('_controlle $offset');
        if (offset == 0) {
          if (loadTopState == false) {
            loadTopState = true;
            print('_controller 到头部 开始刷新 $offset');
          } else {
            print('_controller 头部加载中 $offset');
          }
        }
        if (offset == _controller.position.maxScrollExtent) {
          if (loadBottomState == false) {
            loadBottomState = true;
            const timeout = const Duration(seconds: 5);
            print('currentTime=' + DateTime.now().toString());
            Timer(timeout, () {
              _setScrollList();
              loadBottomState = false;
              //到时回调
              print('afterTimer=' + DateTime.now().toString());
            });

            print('_controller 到底部 加载更多 $offset');
          } else {
            print('_controller 底部加载中 $offset');
            // print(_controller.position.maxScrollExtent);

          }
        }
      });
    _bannerPath = [
      'https://hl-static.haoliao188.com/banner/202009/11/cc623f4e133681e3f4538bdfb1492d9a.png',
      'lib/assets/banner2.png',
      'https://hl-static.haoliao188.com/banner/202009/04/c37c3b09761e08e8edbd5854fa6bf50b.png',
    ];
    _basketballExpertData = [
      {
        'img':
            'https://hl-static.haoliao188.com/user/202008/21/2487f5371f6571500540a82ef5ff4938.jpg',
        'name': '卡里耶维奇',
        'id': '0',
        'rate': '100'
      },
      {
        'img':
            'https://hl-static.haoliao188.com/user/202008/21/2487f5371f6571500540a82ef5ff4938.jpg',
        'name': '卡里耶维奇',
        'id': '1',
        'rate': '100'
      },
      {
        'img':
            'https://hl-static.haoliao188.com/user/202008/21/2487f5371f6571500540a82ef5ff4938.jpg',
        'name': '卡里耶维奇',
        'id': '2',
        'rate': '100'
      },
      {
        'img':
            'https://hl-static.haoliao188.com/user/202008/21/2487f5371f6571500540a82ef5ff4938.jpg',
        'name': '卡里耶维奇',
        'id': '3',
        'rate': '100'
      },
      {
        'img':
            'https://hl-static.haoliao188.com/user/202008/21/2487f5371f6571500540a82ef5ff4938.jpg',
        'name': '卡里耶维奇',
        'id': '4',
        'rate': '20'
      },
      {
        'img':
            'https://hl-static.haoliao188.com/user/202008/21/2487f5371f6571500540a82ef5ff4938.jpg',
        'name': '卡里耶维奇',
        'id': '4',
        'rate': '100'
      },
      {
        'img':
            'https://hl-static.haoliao188.com/user/202008/21/2487f5371f6571500540a82ef5ff4938.jpg',
        'name': '卡里耶维奇',
        'id': '6',
        'rate': '10'
      },
      {
        'img':
            'https://hl-static.haoliao188.com/user/202008/21/2487f5371f6571500540a82ef5ff4938.jpg',
        'name': '卡里耶维奇',
        'id': '7',
        'rate': '100'
      },
      {
        'img':
            'https://hl-static.haoliao188.com/user/202008/21/2487f5371f6571500540a82ef5ff4938.jpg',
        'name': '卡里耶维奇',
        'id': '8',
        'rate': '100'
      }
    ];
    _footballExpertData = [
      {
        'img':
            'https://hl-static.haoliao188.com/user/201907/31/ed3ae8ea9110fd0b6f13368c232f092f.jpg',
        'name': '贝克汉姆解盘',
        'id': '9',
        'rate': '100'
      },
      {
        'img':
            'https://hl-static.haoliao188.com/user/201907/31/ed3ae8ea9110fd0b6f13368c232f092f.jpg',
        'name': '贝克汉姆解盘',
        'id': '10',
        'rate': '100'
      },
      {
        'img':
            'https://hl-static.haoliao188.com/user/201907/31/ed3ae8ea9110fd0b6f13368c232f092f.jpg',
        'name': '贝克汉姆解盘不大行',
        'id': '11',
        'rate': '100'
      },
      {
        'img':
            'https://hl-static.haoliao188.com/user/201907/31/ed3ae8ea9110fd0b6f13368c232f092f.jpg',
        'name': '贝克',
        'id': '12',
        'rate': '100'
      },
      {
        'img':
            'https://hl-static.haoliao188.com/user/201907/31/ed3ae8ea9110fd0b6f13368c232f092f.jpg',
        'name': '汉姆解盘',
        'id': '13',
        'rate': '100'
      },
      {
        'img':
            'https://hl-static.haoliao188.com/user/201907/31/ed3ae8ea9110fd0b6f13368c232f092f.jpg',
        'name': '贝克汉姆解盘',
        'id': '14',
        'rate': '100'
      },
      {
        'img':
            'https://hl-static.haoliao188.com/user/201907/31/ed3ae8ea9110fd0b6f13368c232f092f.jpg',
        'name': '最后一个',
        'id': '15',
        'rate': '100'
      },
      {
        'img':
            'https://hl-static.haoliao188.com/user/201907/31/ed3ae8ea9110fd0b6f13368c232f092f.jpg',
        'name': '不会显示',
        'id': '16',
        'rate': '100'
      },
    ];
    _setScrollList();
  }

  void _setScrollList() {
    listPage++;
    String tate = _contentTabs[_contentTabsIndex];
    int index = listPage * listSize;
    List<Widget> list;
    List<Widget> listAdd = [];
    switch (_contentTabsIndex) {
      case 0:
        list = _scrollList0;
        break;
      case 1:
        list = _scrollList1;
        break;
      default:
        list = _scrollList2;
        break;
    }
    for (var i = index - listSize; i < index; i++) {
      listAdd.add(Container(
        height: 60,
        child: Text('$tate - $i'),
      ));
    }
    setState(() {
      list.addAll(listAdd);
    });
  }

  void _chengContentIndex(index) {
    setState(() {
      _contentTabsIndex = index;
    });
    List<Widget> list;
    switch (index) {
      case 0:
        list = _scrollList0;
        break;
      case 1:
        list = _scrollList1;
        break;
      default:
        list = _scrollList2;
        break;
    }
    if (list.length == 0) {
      _setScrollList();
    }
  }

  Widget _tabIcon(context, List<Map<String, String>> data) {
    List<Widget> list = [];
    List<Widget> icon = [];

    for (var i = 0; i < 7; i++) {
      if (i != 0 && i % 4 == 0) {
        list.add(Row(children: icon));
        icon = [];
      }

      Map<String, String> item = data[i];
      Widget imgWidget;
      String rate = item['rate'];
      String id = item['id'];

      if (item['img'].startsWith('http://') ||
          item['img'].startsWith('https://')) {
        imgWidget = Image.network(item['img']);
      } else {
        imgWidget = Image.asset(item['img']);
      }

      icon.add(Expanded(
          child: Container(
              child: GestureDetector(
                  onTap: () => {
                        Navigator.of(context)
                            .pushNamed("/expert", arguments: {'id': id})
                      }, //点击
                  child: Column(
                    children: [
                      Stack(alignment: Alignment.center, children: [
                        Positioned(
                            child: Container(
                          padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: imgWidget,
                          ),
                        )),
                        Positioned(
                            bottom: 0,
                            child: Container(
                              padding: EdgeInsets.only(left: 2, right: 2),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Text("命中:$rate%",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                            ))
                      ]),
                      Text(
                        item['name'],
                        style: TextStyle(height: 1.5),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  )))));
    }

    icon.add(Expanded(
        child: Container(
            child: GestureDetector(
                onTap: () => {widget.changeTabIndex(1)}, //点击
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.network(
                              'http://customer.haoliao188.com/static/img/more_expert.ddbeb1c.png'),
                        )),
                    Text(
                      '更多大咖',
                      style: TextStyle(height: 1.5),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                )))));
    list.add(Row(children: icon));
    return Column(children: list);
  }

  @override
  Widget build(BuildContext context) {
    contentIconWidget = TabListWidget(
        tabs: _contentTabs,
        tabViews: [
          _scrollList0,
          _scrollList1,
          _scrollList2,
        ],
        callback: (index) => {_chengContentIndex(index)});

    Widget mainWrap = LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return SingleChildScrollView(
          controller: _controller,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage('lib/assets/bannerBg.png'))),
                child: BannerWrapWidget(
                  imgPath: _bannerPath,
                ),
              ),
              TabIconWidget(tabs: _expertTabs, tabViews: [
                _tabIcon(context, _footballExpertData),
                _tabIcon(context, _basketballExpertData)
              ]),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(80),
                    color: Colors.grey[200]),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      color: Colors.white),
                  child: Row(children: [
                    Container(
                      width: (winWidth(context) - 40) / 3 - 5,
                      child: FlatButton(
                          padding: EdgeInsets.only(left: 15),
                          onPressed: null,
                          child: Row(
                            children: [
                              Icon(Icons.ac_unit),
                              Expanded(
                                  child: Text(
                                '专家干货',
                                textAlign: TextAlign.center,
                              )),
                              Text('|')
                            ],
                          )),
                    ),
                    Container(
                      width: (winWidth(context) - 40) / 3 + 10,
                      child: FlatButton(
                          padding: EdgeInsets.only(left: 15),
                          onPressed: null,
                          child: Row(
                            children: [
                              Icon(Icons.ac_unit),
                              Expanded(
                                  child: Text(
                                '每日红人榜',
                                textAlign: TextAlign.center,
                              )),
                              Text('|')
                            ],
                          )),
                    ),
                    Container(
                      width: (winWidth(context) - 40) / 3 - 5,
                      child: FlatButton(
                          padding: EdgeInsets.only(left: 15),
                          onPressed: null,
                          child: Row(
                            children: [
                              Icon(Icons.ac_unit),
                              Expanded(
                                  child: Text(
                                '免费方案',
                                textAlign: TextAlign.center,
                              ))
                            ],
                          )),
                    )
                  ]),
                ),
              ),
              contentIconWidget,
              Text('加载中～～～')
            ],
          ));
    });

    return mainWrap;
  }
}
