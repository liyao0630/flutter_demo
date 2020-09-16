import 'package:flutter/material.dart';
import './config/appConfig.dart';
import 'app.dart';

void main() async {
  var configuredApp = AppConfig(
    appName: 'dev', //主页标题
    apiBaseUrl: 'http://dev.example.com/', //接口域名
    child: App(),
  );
  runApp(configuredApp); //启动应用入口
}
