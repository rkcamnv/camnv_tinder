import 'package:camnv_tinder/src/modules/media/favorite_view.dart';
import 'package:camnv_tinder/src/modules/media/view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tinder',
      routes: routers,
      initialRoute: '/',
    );
  }

  final routers = {
    '/': (BuildContext context) => new MediaPage(),
    '/favorite': (BuildContext context) => new FavoritePage(),
  };
}
