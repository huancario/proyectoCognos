


import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class MovieSearchDelegate extends SearchDelegate{
  @override
  // TODO: implement searchFieldLabel
  String get searchFieldLabel  {
  return 'Buscar Pelicula';
  }
    


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
        IconButton(
        icon:const Icon(Icons.clear),
        onPressed:() =>{query=''} 
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_circle_left_outlined),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
      
    }

  @override
  Widget buildSuggestions(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    if(query==''){
      return const Center(
        child:  Icon(Icons.search ,color: Colors.white38, size: 200,)
      );

    }
    else {

     return FutureBuilder(
       future:moviesProvider.searchMovies(query),
       builder: (context, AsyncSnapshot<List<Movie?>?>snapshot ){
          final movies=snapshot.data;
          if(!snapshot.hasData){

            return Container();
          }else{
             return ListView.builder(
                  itemCount: movies!.length,
                 itemBuilder: (_ , index){
                    return ListTile(
                      leading: FadeInImage(
                        placeholder: const AssetImage('assets/loading.gif'),
                        image: NetworkImage(movies[index]?.fullPosterPath)
                        ),
                      title: Text(movies[index]!.title.toString()),
                      onTap:(){
                        Navigator.pushNamed(context, 'details', arguments:movies[index]);
                        moviesProvider.getMovieCast(movies[index]!.id.toString());
                      }
                    );
                 }
              );
          }
       },
     );
     
    }
  }

      

}