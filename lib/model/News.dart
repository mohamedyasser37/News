import 'Source.dart';

/// source : {"id":"bbc-news","name":"BBC News"}
/// author : "https://www.facebook.com/bbcnews"
/// title : "Cost of living: GP concerns over rise in signs of malnutrition"
/// description : "A group called GPs at the Deep End is concerned patients are lacking in basic vitamins and minerals."
/// url : "https://www.bbc.co.uk/news/uk-scotland-64518568"
/// urlToImage : "https://ichef.bbci.co.uk/news/1024/branded_news/5885/production/_128516622_malnutritiongp.jpg"
/// publishedAt : "2023-02-07T23:00:34Z"
/// content : "More cases of malnutrition are being seen in Scotland, according to doctors working in some of the most deprived communities. \r\nA group called GPs at the Deep End is concerned the cost-of-living cris… [+3107 chars]"
class News {
  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,});

  News.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}