
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CardMovieSwiper extends StatelessWidget {

  final List<Movie> movies;

  const CardMovieSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    // print(movies[0].fullPosterPath);
    final size = MediaQuery.of(context).size;
    final moviesProvider=Provider.of<MoviesProvider>(context);
    
    return Container(
      width: double.infinity,
      height:size.height* 0.5,
      // color:Colors.black,
      child: Swiper(
        itemCount:movies.length, 
        layout: SwiperLayout.STACK,
        itemHeight: size.height * 0.45,
        itemWidth: size.width * 0.7,
        
         itemBuilder: (BuildContext context, index){
           
             return GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, 'details' ,arguments: movies[index]);
                moviesProvider.getMovieCast(movies[index].id.toString());
                },
               child: ClipRRect(
                 borderRadius: BorderRadius.circular(20),
                 
                 child: FadeInImage(
                  placeholder:  const AssetImage('assets/loading.gif'), 
                  image: NetworkImage(movies[index].fullPosterPath),
                  fit: BoxFit.cover,
                  ),
               ),
             ); 
            //  Image.network('https://static0.gamerantimages.com/wordpress/wp-content/uploads/2022/06/Goku-True-Ultra-Instinct.jpg?q=50&fit=contain&w=1140&h=&dpr=1.5');
         },
        // control: const SwiperControl(),
        // pagination: const SwiperPagination(),

        ),
    );
  }
}