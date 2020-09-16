import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'common/device.dart';
import 'config/appConfig.dart';
import 'config/routers.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  @mustCallSuper
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); //注册监听器
  }

  @override
  @mustCallSuper
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this); //移除监听器
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print("$state");
    if (state == AppLifecycleState.resumed) {
      //do sth
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(() {
      //Do sth for debug
      print('checking debug in assert ');
      return true;
    }());

    // Device.initPlatformState();
    // print(Device.deviceData.toString());

    if (kReleaseMode) {
      //Do sth for release
      print('checking release from Environment ');
    } else {
      //Do sth for debug
      print('checking debug from Environment ');
    }

    AppConfig config = AppConfig.of(context);

    print(config.apiBaseUrl);
    Device.sendDuid();

    return MaterialApp(
      title: config.appName,
      theme: ThemeData(
          // primaryColor: Colors.black,
          brightness: Brightness.light,
          primaryColor: Color(0xFF18273F), //Colors.blueGrey[900],
          accentColor: Color(0xFF18273F),
          // primarySwatch: Colors.blueGrey,
          highlightColor: Color.fromRGBO(0, 0, 0, 0),
          splashColor: Color.fromRGBO(0, 0, 0, 0)),
      routes: routers,
      initialRoute: "/",
    );
  }
}
