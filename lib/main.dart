import 'dart:async';
import 'package:flutter/material.dart';
import './config/appConfig.dart';
import 'app.dart';
// import './common/device.dart';

void main() {
//  var sfsdf = await Device().info();
//  print(sfsdf.toString());

  var configuredApp = AppConfig(
    appName: 'example', //主页标题
    apiBaseUrl: 'http://api.example.com/', //接口域名
    child: App(),
  );

  // Framework异常：Flutter 框架在调用 build 方法构建页面时进行了 try-catch 的处理，
  // 并提供了一个 ErrorWidget，用于在出现异常时进行信息提示：
  // 但是，我们不能丢弃掉这样的异常信息，需要提供统一的异常处理机制，用于后续分析异常原因。
  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
    return Scaffold(
        body: Center(
      child: Text("Custom Error Widget"),
    ));
  };

  // 为了集中处理框架异常，Flutter 提供了 FlutterError 类，
  // 这个类的 onError 属性会在接收到框架异常时执行相应的回调。
  // 因此，要实现自定义捕获逻辑，我们只要为它提供一个自定义的错误处理回调即可。
  FlutterError.onError = (FlutterErrorDetails details) async {
    // 在下面的代码中，我们使用 Zone 提供的 handleUncaughtError 语句，
    // 将 Flutter 框架的异常统一转发到当前的 Zone 中，这样我们就可以统
    // 一使用 Zone 去处理应用内的所有异常了：
    Zone.current.handleUncaughtError(details.exception, details.stack);
  };

  // app异常：runZoned 同步和异步的异常都可以捕获。
  runZoned<Future<Null>>(() async {
    runApp(configuredApp); //启动应用入口
  }, onError: (error, stackTrace) async {
    //Do sth for error
  });
}
