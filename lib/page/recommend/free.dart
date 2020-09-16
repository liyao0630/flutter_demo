import 'package:flutter/material.dart';

class Free extends StatefulWidget {
  Free({Key key}) : super(key: key);

  @override
  _FreeState createState() => _FreeState();
}

class _FreeState extends State<Free> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Text('免费')],
      ),
    );
  }
}
