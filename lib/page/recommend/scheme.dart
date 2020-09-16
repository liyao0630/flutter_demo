import 'package:flutter/material.dart';
import '../../widgets/banner.dart';

class Scheme extends StatefulWidget {
  Scheme({Key key}) : super(key: key);

  @override
  _SchemeState createState() => _SchemeState();
}

class _SchemeState extends State<Scheme> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage('lib/assets/bannerBg.png'))),
            child: BannerWidget(
              imgPath: [
                // 'https://hl-static.haoliao188.com/banner/202009/11/cc623f4e133681e3f4538bdfb1492d9a.png',
                // 'https://hl-static.haoliao188.com/banner/202009/11/cc623f4e133681e3f4538bdfb1492d9a.png'
                'lib/assets/banner1.png',
                'lib/assets/banner2.png',
                'lib/assets/banner3.png',
              ],
            ),
          ),
          Text(
            '方案' * 2000,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
