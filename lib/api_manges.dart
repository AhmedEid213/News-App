import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourcesResponse.dart';

class ApiManger {
  static const String baseUrl = 'newsapi.org';

  static Future<SourcesResponse> getsources({categoryId,}) async {
    var url = Uri.https(baseUrl, '/v2/top-headlines/sources',
        {'apiKey': '85b4206d1134426abb7385d7242b27ce',
          'category':categoryId,

        });

    //https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    } catch (e) {
      throw e;
    }
  }

  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=85b4206d1134426abb7385d7242b27ce

 static Future<NewsResponse> getNews({String? sourceId,String? searchKeyWord})async{
    var url = Uri.https(baseUrl,'/v2/everything',{
      'apiKey': '85b4206d1134426abb7385d7242b27ce',
      'sources': sourceId,
      'q':searchKeyWord,
    });
    try{
      var response =await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var newsRespose = NewsResponse.fromJson(json);
      return newsRespose;
    }catch(e){
      throw e;
    }


  }
}
