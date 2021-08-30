import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/PC/flutter/twitter_clone/lib/home/home_view.dart';
import 'package:twitter_clone/home/tabbar_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: TwitterTabBarView(),
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        textTheme: Theme.of(context).textTheme.copyWith(
              headline1: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Colors.black,
              ),
            ),
        tabBarTheme: TabBarTheme(
            labelColor: CupertinoColors.activeBlue,
            unselectedLabelColor: CupertinoColors.inactiveGray),
      ),
    );
  }
}
