import 'package:flutter/material.dart';
import 'package:news/News/News_details.dart';
import 'package:news/model/News.dart';
import 'package:cached_network_image/cached_network_image.dart';
class NewsItem extends StatelessWidget {
  News news;
NewsItem(this.news);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, NewsDetails.routeName,arguments: news);
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18)
              ),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ??'',height: 200,width: double.infinity,
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),

              ),
            ),

            
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(news.author??'',textAlign: TextAlign.start,),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(news.title??'',textAlign: TextAlign.start,style: TextStyle(
                color: Colors.black,fontSize: 22
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(showPublishedAT(news)??'',
              textAlign: TextAlign.end,),
            ),
          ],
        ),

      ),
    );
  }
  showPublishedAT(News news) {
    var dataTimeNow = DateTime.now();
    var difference = dataTimeNow
        .difference(DateTime.parse(news.publishedAt ?? ''))
        .inMinutes;

    if (difference < 0) {
      difference = dataTimeNow
          .difference(DateTime.parse(news.publishedAt ?? ''))
          .inSeconds;
      return '$difference second Ago';
    } else if (difference < 60) {
      var difference = dataTimeNow
          .difference(DateTime.parse(news.publishedAt ?? ''))
          .inMinutes;
      return '$difference minutes Ago';
    }else if (difference < 1440) {
      var difference = dataTimeNow
          .difference(DateTime.parse(news.publishedAt ?? ''))
          .inMinutes;
      return '$difference hours Ago';
    }else if (difference < 44640) {
      var difference = dataTimeNow
          .difference(DateTime.parse(news.publishedAt ?? ''))
          .inMinutes;
      return '$difference days Ago';
    }
  }
}
