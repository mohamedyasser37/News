import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';
class ApiManager{
 static const String baseUrl='newsapi.org' ;
 static const String ApiKey='b76e8a5b36cc4ea88abee249d15a7cad' ;
 static Future<SourceResponse> getSource(String categoryID) async{
    var url = Uri.https(baseUrl, '/v2/top-headlines/sources', {
       'apiKey': ApiKey,
       'category':categoryID,
    });
   var response=await http.get(url);
  return SourceResponse.fromJson(jsonDecode(response.body));

  }
static Future<NewsResponse>getNews({String? sourceID,String? query})async{
   var url=Uri.https(baseUrl,'/v2/everything',{
     'apiKey':ApiKey,
     'sources':sourceID,
     'q':query,
     'pageSize':'10'
   }
   );
  var response=await http.get(url);
  return NewsResponse.fromJson(jsonDecode(response.body));
}
}