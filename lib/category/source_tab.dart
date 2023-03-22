import 'package:flutter/material.dart';
import 'package:news/model/Source.dart';

class SourceTab extends StatelessWidget {
Source source;
bool selected;
SourceTab(this.source,this.selected);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(vertical: 18),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color:selected? Colors.green:Colors.transparent,
        borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.green,)
      ),
      child: Text(
        source.name??'',style: TextStyle(fontSize: 16, color:selected? Colors.white:Colors.green, ),
      ),
    );
  }
}
