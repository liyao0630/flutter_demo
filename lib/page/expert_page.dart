import 'package:flutter/material.dart';

class ExpertPage extends StatefulWidget {
  ExpertPage({Key key, @required this.arguments}) : super(key: key);

  final arguments;

  static const String routeName = '/expert';

  @override
  _ExpertPageState createState() => _ExpertPageState();
}

class _ExpertPageState extends State<ExpertPage> {
  String _id;
  @override
  void initState() {
    super.initState();
    _id = widget.arguments['id'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Content'),
      ),
      body: Container(
        child: Column(
          children: [Text('专家ID：$_id')],
        ),
      ),
    );
  }
}
