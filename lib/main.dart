import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toko_digital/view/belanja/beranda.dart';
import 'package:toko_digital/view/belanja/provider/belanja_provider.dart';
import 'package:toko_digital/view/splash_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => BelanjaProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: MyApp(),
      home: SplashScreen(s: "notification_render"),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) {
          return MyApp();
        }
      },
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new Beranda();
  }
}
