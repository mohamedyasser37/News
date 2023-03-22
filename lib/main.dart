import 'package:flutter/material.dart';
import 'package:news/News/News_details.dart';
import 'package:news/view/home_view.dart';
import 'package:news/view/search.dart';
import 'package:news/view/setting.dart';
import 'package:news/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName:(context) => SplashView(),
        HomeView.routeName:(context) => HomeView(),
        NewsDetails.routeName:(context) => NewsDetails(),
        Setting.routName:(context) => Setting(),
        Search.routeName:(context) => Search()
      },
    );
  }
}


