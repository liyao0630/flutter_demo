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
  List<String> _imgPath;
  int _size;
  int _activeIndex = 0;
  Timer _timer;
  double width = 0;
  double _marginRight = 20.0;
  double _dx;
  ScrollController _controller = new ScrollController();
  Duration _durationBanner = Duration(seconds: 4);
  Duration _animateDration = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _size = widget.imgPath.length;
    _imgPath = widget.imgPath;
    _startTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    _clearTimer();
    super.dispose();
  }

  void _setDx(double dx) {
    setState(() {
      _dx = dx;
    });
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

  void _startTimer() {
    if (_timer == null) {
      var callback = (timer) => {
            setState(() {
              if (_activeIndex == _size - 1) {
                _activeIndex = 0;
              } else {
                _activeIndex++;
              }
            }),
            _bannerAnimate()
          };
      _timer = Timer.periodic(_durationBanner, callback);
    }
  }

  void _bannerAnimate() {
    _controller.animateTo((width + _marginRight) * _activeIndex,
        duration: _animateDration, curve: Curves.linear);
  }

  void _clearTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: LayoutBuilder(builder: (context, constraints) {
        if (width == 0) {
          width = constraints.biggest.width;
        }

        return Container(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
            children: <Widget>[
              Positioned(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: new NeverScrollableScrollPhysics(),
                  child: Row(
                    children: _createdItemList(width),
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
      }),
      onLongPressStart: (LongPressStartDetails e) {
        _clearTimer();
        print("onLongPressStart");
      },
      onLongPressUp: () {
        _startTimer();
        print("onLongPressUp");
      },
      onHorizontalDragStart: (DragStartDetails e) {
        _clearTimer();
        _setDx(0);
      },
      onHorizontalDragUpdate: (DragUpdateDetails e) {
        // dx 负数：向左滑动； 整数：向右滑动
        // print("dx: ${e.delta.dx}, dy: ${e.delta.dy}");
        _setDx(e.delta.dx);
      },
      onHorizontalDragEnd: (DragEndDetails e) {
        int index = _activeIndex;
        if (_dx < 0) {
          index++;
        }
        if (_dx > 0) {
          index--;
        }

        setState(() {
          if (index == _size) {
            _activeIndex = 0;
          } else if (index < 0) {
            _activeIndex = _size - 1;
          } else {
            _activeIndex = index;
          }
        });
        _bannerAnimate();

        _startTimer();
        //打印滑动结束时在x、y轴上的速度
        // print(e.velocity);
      },
    );
  }
}
