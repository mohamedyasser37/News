import 'dart:async';

import 'package:flutter/material.dart';

import 'home_view.dart';

class SplashView extends StatefulWidget {

  static const routeName="SplashView"  ;

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {

    Timer(Duration(seconds: 1),(){
      Navigator.of(context).pushReplacementNamed(HomeView.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {


    return Stack(children: [
      Container(color: Colors.white,
      child: Image.asset("assets/images/pattern0.png",
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,),),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(

          child: Image.asset("assets/images/logo.png"),
        ),
      )

    ],);


  }
}
