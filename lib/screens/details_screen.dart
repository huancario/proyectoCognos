

import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';



class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //TODO: cambiar por una instancia de movie

    final Movie movie= ModalRoute.of(context)!.settings.arguments as Movie;
     final moviesProvider= Provider.of<MoviesProvider>(context);
     
      
  return  Scaffold(
      body: CustomScrollView(
            slivers:[
                 _CustomAppBar(movie:movie),
                
               SliverList(
                delegate:SliverChildListDelegate([
                   _PosterAndTitle(movie: movie,),
                   _OverView(movie:movie),
               
                    CastingCard(listCast: moviesProvider.movieCast)
                ])
              ),
            ],
        )
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;
  const _CustomAppBar ({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return   SliverAppBar(
        backgroundColor: Colors.green,
        expandedHeight: 200,
        floating: false,
        pinned:true,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          titlePadding: const EdgeInsets.symmetric(horizontal: 10),
          title: Text(movie.title!, textAlign: TextAlign.center,),
          background:  FadeInImage(
            placeholder: const AssetImage('assets/loading.gif'),
            image:NetworkImage(movie.fullPosterPath),
            fit:BoxFit.cover,
           
          ),
        ),

    );
  }
}


class _PosterAndTitle extends StatelessWidget {

  final Movie movie;
  const _PosterAndTitle({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top:20),
      padding:const EdgeInsets.only(left:20),
      width: double.infinity,
      child: Row(
        
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:   FadeInImage(
              placeholder:  const AssetImage('assets/loading.gif'),
              image:  NetworkImage(movie.fullPosterPath),
              width: 100,
              height:150,            
              fit: BoxFit.cover,
              ),
          ),
          
          const SizedBox(width: 20,),

          Column(
            
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children:   [
               Text(movie.title!, overflow: TextOverflow.ellipsis,maxLines: 2,),
               Text(movie.originalTitle, overflow: TextOverflow.ellipsis,maxLines: 2,),
                Row(
                  children:  [
                    const Icon(Icons.star_outline_outlined),
                    const SizedBox(width:5),
                    Text(movie.voteAverage.toString(), style:Theme.of(context).textTheme.caption),
                  ],
                )    
            ],
          )

        ],
      )
    ); 
  }
}

class _OverView extends StatelessWidget {
  final Movie movie;
  const _OverView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin:const EdgeInsets.only(left: 20,right:20),
      padding: const EdgeInsets.all(20),
      child:  Text(movie.overview,
         textAlign: TextAlign.justify,
      ),

    );
  }
}
