import 'package:bytebank/screens/transfer/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(FirstApp());

class FirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This app is designed only to work vertically, so we limit
    // orientations to portrait up and down.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'ByteBank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.green,
          primaryColor: Colors.green,
          accentColor: Colors.yellow,
          primaryTextTheme: TextTheme(
            title: TextStyle(
//            color: Colors.white,
                ),
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.yellow, //  <-- dark color
            textTheme: ButtonTextTheme.primary, // <-- auto select right color
          )),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.deepPurple,
          primaryColor: Colors.deepPurple,
          accentColor: Colors.purple,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.purple, //  <-- dark color
            textTheme: ButtonTextTheme.primary, //  <-- auto selects right color
          )),
      home: ListTransfer(),
    );
  }
}
