


import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';


class CastingCard extends StatelessWidget {
   final List<Cast> listCast;
   const CastingCard({super.key, required this.listCast});

  @override
  Widget build(BuildContext context) {

      //  
      //  final listCast =moviesProvider.movieCast;
      // print(listCast[0].name);

    return Container(
      width:double.infinity,
      height:180,
      // color:Colors.red,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:listCast.length,
          itemBuilder: (BuildContext context, int index) => _CastCard(actor:listCast[index])
        ),


    );
  }
}



class _CastCard extends StatelessWidget {
  final Cast actor;
  const _CastCard({super.key, required this.actor, });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:100,
      height:100,
      // color:Colors.green,
      margin:const EdgeInsets.symmetric(horizontal: 10),
      child:Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:  FadeInImage(
              placeholder: const AssetImage('assets/loading.gif'),
              
              image: NetworkImage(actor.getCastPathImg),
              width: 100,
              height: 140,
              fit:BoxFit.cover,
            ),

          ),
          Text(actor.name!,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          maxLines: 2,
          
          )
        ],
      )

    );
  }
}