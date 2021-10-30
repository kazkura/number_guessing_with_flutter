import 'package:flutter/material.dart';
import 'package:number_guessing/common/theme.dart';
import 'package:number_guessing/screens/myhomepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '数字当てゲーム',
      theme: appTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: '数字当てゲーム'),
      },
    );
  }
}

