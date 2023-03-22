import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/model/News.dart';
import 'package:url_launcher/url_launcher.dart';
class NewsDetails extends StatelessWidget {
  static const routeName = "NewsDetails";

  @override
  Widget build(BuildContext context) {
    News news = ModalRoute.of(context)!.settings.arguments as News;
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            "assets/images/pattern0.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('News Details'),
            centerTitle: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
          ),
          body: Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: CachedNetworkImage(
                      imageUrl: news.urlToImage ?? '',
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.91,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0, top: 8),
                    child: Text(
                      news.author ?? '',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(color: Color.fromARGB(255, 121, 130, 139)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      news.title ?? '',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      showPublishedAT(news),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 1,
                              offset: Offset(1, 2))
                        ]),
                    child: Column(
                      children: [
                        Text(
                          news.description ?? "",
                          style: TextStyle(fontSize: 18),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: InkWell(
                            onTap: (){
                              _launchUrl(Uri.parse(news.url??''));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'View Full Artical',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Color.fromRGBO(66, 80, 92, 1)),
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  size: 28,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
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
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
