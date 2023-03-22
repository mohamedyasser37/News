import 'package:flutter/material.dart';
import 'package:news/view/home_view.dart';

class Setting extends StatefulWidget {
  static const routName="setting";

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Container(
    child: Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: (){
                setState(() {
                  Navigator.pushReplacementNamed(context, HomeView.routeName);
                });

              },
              child: Icon(Icons.home,size: 30,)),
        ],
      title: Text('Setting'),
      centerTitle: true,
    ),
    body: Column(
      children: [

      ],
    ),),
    );
  }
}
