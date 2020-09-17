import 'package:flutter/material.dart';

import 'config/constant.dart';
import 'view/detail/detail_page.dart';
import 'view/home/home_page.dart';

void main() {
  runApp(
    MainApp(),
  );
}

class MainApp extends StatelessWidget {
  final Map<String, WidgetBuilder> _routes = <String, WidgetBuilder>{
    Constant.homeRouteName: (BuildContext context) {
      return HomePage();
    },
    Constant.detailRouteName: (BuildContext context) {
      return DetailPage();
    },
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: _routes,
      initialRoute: Constant.homeRouteName,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}
