import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '数字当てゲーム',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '数字当てゲーム'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _numStr = '';
  String _message = '';
  String _history = '';
  int randNum = 0;

  // 初期化
  @override
  void initState() {
    super.initState();
    randNum = Random().nextInt(100);
  }

  // テキストフィールドが更新されるたびに文字列をセット
  void _setNumber(String text){
    setState(() {
      _numStr = text;
    });
  }

  // 判定ボタンを押すと、入力した数字を判定関数に渡す
  void _startJudge(){
    setState(() {
      _judgeNumber(_numStr);
    });
  }

  // 判定してメッセージを表示する。ヒストリーに入力値を追加する
  void _judgeNumber(String numString){
    setState(() {
      var num = int.parse(numString);
      if( num == randNum){
        _message = 'おめでとう! 正解です!';
      }else if(num > randNum){
        _message = '今の予想は大きすぎです!もっと小さな数字です。';
      }else{
        _message = '今の予想は小さすぎです!もっと大きな数字です。';
      }
      _history += numString + ' ';
    });
  }

  // リセットする
  void _resetGame(){
    setState(() {
      randNum = Random().nextInt(100);
      _message = '';
      _history = '';
    });
  }

  // ウェジットのビルド関数
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 説明文
            Container(
              width: 400,
              child: Text('1 から 100 までの数字を当ててみて！'
                    '10 回以内に当てられるでしょうか。'
                    '選んだ数字が大きいか小さいかを表示します。'
              )
            ),
            // 数値入力フォーム
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  child: Text('予想を入力してください: ')),
                Container(
                  width: 100,
                  child: TextField(
                    onChanged: _setNumber,
                    onSubmitted: _judgeNumber
                  )
                ),
                Container(
                  width: 100,
                  child: TextButton(
                    onPressed: _startJudge,
                    child: Text('予想を入力')
                  )
                )
              ]
            ),
            // 判定結果
            Container(
              width: 400,
              child: Text('$_message')),
            // 履歴
            Container(
              width: 400,
              child: Text('$_history')),
            // リセットボタン
            Container(
              width: 400,
              child: TextButton(
                  onPressed: _resetGame,
                  child: Text('再度挑戦')
              )
            )
          ],
        ),
      ),
    );
  }
}
