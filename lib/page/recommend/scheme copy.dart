import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/banner.dart';
import '../../widgets/tab_icon.dart';
import '../../store/recommendModel.dart';

class Scheme extends StatefulWidget {
  Scheme({Key key, this.changeTabIndex}) : super(key: key);
  final Function changeTabIndex;
  // final Function changeTabIndex;
  @override
  _SchemeState createState() => _SchemeState();
}

class _SchemeState extends State<Scheme> with TickerProviderStateMixin {
  bool loadTopState = false;
  bool loadBottomState = false;
  List<String> _expertTabs = ['足球专家', '篮球专家'];
  List<Map<String, String>> _footballExpertData;
  List<Map<String, String>> _basketballExpertData;
  List<Widget> _scrollList = [];
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
            print('_controller开始加载 $offset');
          } else {
            print('_controller加载中 $offset');
            print(_controller.position.maxScrollExtent);
          }
        }
        if (offset == _controller.position.maxScrollExtent) {
          print('_controller到底了 $offset');
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
  }

  // void _createListItem() {
  //   _scrollList.add(TabIconWidget(tabs: _expertTabs, tabViews: [
  //     _tabIcon(context, _footballExpertData),
  //     _tabIcon(context, _basketballExpertData)
  //   ]));
  // }

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
    // Widget columnWidget = Column(
    // _createListItem();
    // _createListItem();
    Widget mainWrap = Column(
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
                borderRadius: BorderRadius.circular(80), color: Colors.white),
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
                          '专家干货${Provider.of<RecommendModel>(context).tabIndex}',
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
                          '每日红人榜${Provider.of<Counter>(context).count}',
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
        Container(
          child: Column(
            children: _scrollList,
          ),
        ),
      ],
    );

    return Flex(
      direction: Axis.vertical,
      children: [
        mainWrap,
        Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemExtent: 50.0, //强制高度为50.0
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text("$index"));
                }))
      ],
    );
  }
}
