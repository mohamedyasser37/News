import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/News/News_Item.dart';
import 'package:news/model/News.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/api_manager.dart';

class Search extends StatefulWidget {
  static const routeName = 'Search';

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var controller = TextEditingController();
  String query = "";
  List<News> list = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            title: Container(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                //color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              // margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: controller,
                onChanged: (String? value) {
                  setState(() {
                    query = value!;
                  });
                },
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.white)),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.white)),
                    contentPadding: EdgeInsets.only(top: 22),
                    hintText: 'search article',
                    hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                    ),
                    prefixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          controller.clear();
                        });
                      },
                      icon: Icon(Icons.close),
                    )),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  NewsItem(search().elementAt(index)),
              itemCount: search().length,
            ),
          ),
        ),
      ],
    );
  }

  List search() {
    ApiManager.getNews(query: query).then((NewsResponse) {
      list = NewsResponse.articles ?? [];
    }).catchError((error) {
      debugPrint('errooooor');
    });
    return list;
  }
}
