




import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;
  const MovieSlider({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      height:300,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Padding(
            padding: EdgeInsets.only(left: 23),
            child: Text('Populares',style: TextStyle(color: Colors.green,fontSize: 20),)
            ),
            
            const SizedBox(height:10),
            //

            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:movies.length,
                
                itemBuilder: (context,index){
                  return  _MoviePoster(movie:movies[index]);
                },
                
                ),
            ),
        ],
      ),

    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;
  const _MoviePoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final moviesProvider=Provider.of<MoviesProvider>(context);
    return Container(
           height: 250,
           width: 190,
          //  color:Colors.green,
           margin: const EdgeInsets.symmetric(horizontal: 10, ),
           child: Column(
             children:  [
                GestureDetector(
                  onTap:(){
                    Navigator.pushNamed(context, 'details', arguments: movie);
                     moviesProvider.getMovieCast(movie.id.toString());
                    },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child:  FadeInImage(
                      height: 230,
                      width: 190,
                      placeholder: const AssetImage('assets/loading.gif'), 
                      image: NetworkImage(movie.fullPosterPath),
                      fit: BoxFit.cover,
                      ),
                  ),
                ),

                  Text(movie.title!, maxLines: 1,overflow: TextOverflow.ellipsis,)
             ],
           )
  
        );
  }
}