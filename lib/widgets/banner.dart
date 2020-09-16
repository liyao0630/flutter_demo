import 'dart:async';

import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  BannerWidget({Key key, @required this.imgPath}) : super(key: key);

  final List<String> imgPath;

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget>
    with SingleTickerProviderStateMixin {
  ScrollController _controller = new ScrollController();
  int _size;
  List<String> _imgPath;
  double _marginRight = 20;
  Timer _timer;
  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();
    _size = widget.imgPath.length;
    _imgPath = widget.imgPath;
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      print(_controller.offset); //打印滚动位置
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  List<Widget> _createdIconList(BuildContext context) {
    List<Widget> list = [];
    Color color;
    for (var i = 0; i < _size; i++) {
      if (i == _activeIndex) {
        color = Theme.of(context).primaryColor;
      } else {
        color = Colors.white;
      }
      list.add(Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        width: 10,
        height: 10,
        child: FlatButton(
          color: color,
          child: null,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          onPressed: () => {},
        ),
      ));
    }
    return list;
  }

  List<Widget> _createdItemList(double parentWidth) {
    List<Widget> list = [];
    for (var i = 0; i < _size; i++) {
      list.add(Container(
        width: parentWidth,
        margin: EdgeInsets.only(right: _size - 1 == i ? 0 : _marginRight),
        child: ClipRRect(
            //圆角矩形裁剪控件
            borderRadius: BorderRadius.circular(20), //圆角半径
            child: Image.asset(
              _imgPath[i],
            ) //图片控件
            ),
      ));
    }
    return list;
  }

  void _startTimer(width) {
    if (_timer == null) {
      Duration duration = Duration(seconds: 2);
      var callback = (timer) => {
            setState(() {
              if (_activeIndex == _size - 1) {
                _activeIndex = 0;
              } else {
                _activeIndex++;
              }
            }),
            _controller.jumpTo((width + _marginRight) * _activeIndex)
          };
      _timer = Timer.periodic(duration, callback);
    }
  }

  @override
  Widget build(BuildContext context) {
    // _timer?.cancel();
    return LayoutBuilder(builder: (context, constraints) {
      final double endWidth = constraints.biggest.width;
      _startTimer(endWidth);
      return Container(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
          children: <Widget>[
            Positioned(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _createdItemList(endWidth),
                ),
                controller: _controller,
              ),
            ),
            Positioned(
                bottom: 10,
                child: Container(
                  height: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _createdIconList(context),
                  ),
                )),
          ],
        ),
      );
    });
  }
}
