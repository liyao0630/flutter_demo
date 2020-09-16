import 'package:flutter/material.dart';

class ContentPage extends StatefulWidget {
  static const String routeName = '/content';

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Content'),
      ),
      body: Container(
        child: Column(
          children: [Text('内容页')],
        ),
      ),
    );
  }
}
