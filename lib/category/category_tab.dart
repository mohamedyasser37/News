import 'package:flutter/material.dart';
import 'package:news/News/News_List.dart';
import 'package:news/category/source_tab.dart';
import 'package:news/model/News.dart';

import '../model/Source.dart';

class CategoryTab extends StatefulWidget {
  List<Source> source;

  CategoryTab(this.source);

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
          length: widget.source.length,
          child: Column(
            children: [
              TabBar(
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                tabs: widget.source
                    .map((item) => SourceTab(
                        item, widget.source.indexOf(item) == selectedIndex))
                    .toList(),
                isScrollable: true,
                indicatorColor: Colors.transparent,
              ),
              Expanded(child: NewsList(widget.source[selectedIndex]))
            ],
          )),
    );
  }
}
