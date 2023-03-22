import 'package:flutter/material.dart';
import 'package:news/News/News_Item.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/Source.dart';
import 'package:news/model/api_manager.dart';

class NewsList extends StatelessWidget {
Source source;
NewsList(this.source);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(sourceID:  source.id??''),
    builder:(BuildContext, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator(),);
      }
      if (snapshot.hasError) {
        return Center(
          child: Text('Error Loading Data '),);
      }
      if (snapshot.data?.status == 'error') {
        return Center(child: Text('Server Error ${snapshot.data?.message}'),);
      }
      var newsList = snapshot.data?.articles;
      return ListView.builder(itemBuilder: (context, index) {
        return NewsItem(newsList![index]);
      }, itemCount:
      newsList?.length ?? 0,);
    }
      ),
    );
  }
}
