



import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());


class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (_)=>MoviesProvider(),lazy: false,)
       ],
       child: const MyApp(),
      );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes:{
        'homeScreen'    : (BuildContext context) =>  const HomeScreen(), 
        'details' : (BuildContext context) =>  const DetailsScreen(), 
        } 
        ,
        theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
            color: Colors.green,
          )
        ),
      initialRoute: 'homeScreen',
    );
  }
}