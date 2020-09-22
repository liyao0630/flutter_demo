import 'dart:async';

import 'package:flutter/material.dart';

class BannerWrapWidget extends StatelessWidget {
  BannerWrapWidget({Key key, @required this.imgPath}) : super(key: key);

  final List<String> imgPath;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return _BannerWidget(imgPath: imgPath, width: constraints.biggest.width);
    });
  }
}

class _BannerIconWidget extends StatelessWidget {
  _BannerIconWidget(
      {Key key,
      @required this.color,
      @required this.active,
      @required this.total})
      : super(key: key);

  final Color color;
  final int active;
  final int total;

  List<Widget> _list() {
    List<Widget> list = [];
    Color colorBg;
    int index = active;
    if (index == 0) {
      index = 1;
    }
    if (active == total - 1) {
      index = active - 1;
    }
    for (var i = 1; i < total - 1; i++) {
      if (i == index) {
        colorBg = color;
      } else {
        colorBg = Colors.white;
      }
      list.add(Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        width: 10,
        height: 10,
        child: FlatButton(
          color: colorBg,
          child: null,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          onPressed: () => {},
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 10,
        child: Container(
          height: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _list(),
          ),
        ));
  }
}

class _BannerItemWidget extends StatelessWidget {
  _BannerItemWidget(
      {Key key,
      @required this.controller,
      @required this.width,
      @required this.margin,
      @required this.imgs})
      : super(key: key);

  final double width;
  final EdgeInsets margin;
  final List<String> imgs;
  final ScrollController controller;

  List<Widget> _itemList() {
    List<Widget> list = [];
    for (var i = 0; i < imgs.length; i++) {
      String path = imgs[i];
      Widget img;
      if (path.startsWith('http://') || path.startsWith('https://')) {
        img = Image.network(path);
      } else {
        img = Image.asset(path);
      }
      list.add(
        Container(
            width: width,
            margin: margin,
            child: ClipRRect(
                //圆角矩形裁剪控件
                borderRadius: BorderRadius.circular(20), //圆角半径
                child: img //图片控件
                ) //图片控件
            ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: new NeverScrollableScrollPhysics(),
        child: Row(
          children: _itemList(),
        ),
        controller: controller,
      ),
    );
  }
}

class _BannerWidget extends StatefulWidget {
  _BannerWidget({Key key, @required this.imgPath, @required this.width})
      : super(key: key);

  final List<String> imgPath;
  final double width;

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<_BannerWidget>
    with SingleTickerProviderStateMixin {
  List<String> _imgPath = [];
  int _size;
  int _activeIndex = 1;
  Timer _timer;
  double _width = 0;
  double _marginRight = 20.0;
  double _dx;
  ScrollController _controller = ScrollController();
  Duration _durationBanner = Duration(seconds: 4);
  Duration _animateDration = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _width = widget.width;
    _imgPath = widget.imgPath;
    _imgPath.insert(0, _imgPath[_imgPath.length - 1]);
    _imgPath.add(widget.imgPath[1]);
    _size = _imgPath.length;
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

  void _startTimer() {
    if (_timer == null) {
      _timer = Timer.periodic(_durationBanner, _timercallback);
    }
  }

  void _timercallback(timer) {
    _bannerScrollRight();
  }

  void _bannerScrollRight() {
    int indexTpl = _activeIndex;
    bool state = false;
    indexTpl++;
    if (indexTpl == _size - 1) {
      _controller.animateTo((_width + _marginRight) * (indexTpl),
          duration: _animateDration, curve: Curves.linear);
      state = true;
      indexTpl = 1;
    }
    setState(() {
      _activeIndex = indexTpl;
    });
    if (state) {
      Timer(_animateDration,
          () => {_controller.jumpTo((_width + _marginRight) * 1)});
    } else {
      _bannerAnimate();
    }
  }

  void _bannerScrollLeft() {
    int indexTpl = _activeIndex;
    bool state = false;
    indexTpl--;
    if (indexTpl == 0) {
      _controller.animateTo(0, duration: _animateDration, curve: Curves.linear);
      state = true;
      indexTpl = _size - 2;
    }

    setState(() {
      _activeIndex = indexTpl;
    });

    if (state) {
      Timer(_animateDration,
          () => {_controller.jumpTo((_width + _marginRight) * indexTpl)});
    } else {
      _bannerAnimate();
    }
  }

  void _bannerAnimate() {
    _controller.animateTo((_width + _marginRight) * _activeIndex,
        duration: _animateDration, curve: Curves.linear);
  }

  void _clearTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    _controller = ScrollController(initialScrollOffset: _width + _marginRight);
    return GestureDetector(
      child: Container(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
          children: <Widget>[
            _BannerItemWidget(
                controller: _controller,
                width: _width,
                margin: EdgeInsets.only(right: _marginRight),
                imgs: _imgPath),
            _BannerIconWidget(
                color: primaryColor, active: _activeIndex, total: _size)
          ],
        ),
      ),
      onLongPressStart: (LongPressStartDetails e) {
        _clearTimer();
      },
      onLongPressUp: () {
        _startTimer();
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
        // int index = _activeIndex;
        if (_dx < 0) {
          _bannerScrollRight();
        }
        if (_dx > 0) {
          _bannerScrollLeft();
        }
        _startTimer();
        //打印滑动结束时在x、y轴上的速度
        // print(e.velocity);
      },
    );
  }
}
