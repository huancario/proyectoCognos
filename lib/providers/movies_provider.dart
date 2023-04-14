


import 'package:http/http.dart' as http;


import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier{

final String _apiKey   = 'fc86c467ce8c84816e7db6d6ab52831c';
final String _baseUrl  = 'api.themoviedb.org';
final String _language = 'es-ES';
final String imgBase ='https://image.tmdb.org/t/p/w500';

// List<String> movieCast=[];
List<Movie> onDisplayMovies = [];
List<Movie> popularMovies   = [];
List<Cast> movieCast = [];

  MoviesProvider(){
    print('movies provider inicializado');

    getOnDisplayMovies();
    getPopularMovies();
  
  }


 Future<List<Movie?>?> searchMovies(String query)async{
     var url= Uri.https(_baseUrl,'3/search/movie',{
     'api_key' : _apiKey,
     'language':_language,
     'query': query
   });
   final response = await http.get(url);
   final searchResponse = SearchResponse.fromJson(response.body);
  //  print(searchResponse.results![0]!.title);
   return searchResponse.results;
  }
  


getMovieCast(String i)async{
   var url= Uri.https(_baseUrl,'3/movie/$i/credits',{
     'api_key' : _apiKey,
     'language':_language,
     'page':'1'
   });
   final response = await http.get(url);
   final castResponse= CastResponse.fromJson(response.body);
   print(castResponse.cast[0].profilePath);
   movieCast=castResponse.cast;
   notifyListeners();
}


  getOnDisplayMovies() async{

      var url=Uri.https(_baseUrl,'3/movie/now_playing',{
        'api_key'  :_apiKey,
        'language' : _language,
        'page'     : '1'
      });

      final response= await http.get(url);
     final nowPlayingResponse= NowPlayingResponse.fromJson(response.body);
    //  print(nowPlayingResponse.results[0].title);
     onDisplayMovies=nowPlayingResponse.results;
    //  print(nowPlayingResponse.results);
     notifyListeners();

  }

  getPopularMovies()async{

    var url=Uri.http(_baseUrl,'3/movie/popular',{
       'api_key' : _apiKey,
       'language': _language,
       'page'    : '1'
      } 
    );
    final response= await http.get(url);
    final popularResponse= PopularResponse.fromJson(response.body);
    print(popularResponse.results[0].title);

     popularMovies=[...popularMovies, ...popularResponse.results];
     print(popularMovies[0].id);
     notifyListeners();
  }


  

}