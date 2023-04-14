

// To parse this JSON data, do
//
//     final castResponse = castResponseFromMap(jsonString);

import 'dart:convert';

import 'package:peliculas/models/models.dart';

class CastResponse {
    CastResponse({
        required this.id,
        required this.cast,
        required this.crew,
    });

    int? id;
    List<Cast> cast;
    List<Cast> crew;

    factory CastResponse.fromJson(String str) => CastResponse.fromMap(json.decode(str));


    factory CastResponse.fromMap(Map<String, dynamic> json) => CastResponse(
        id: json["id"],
        cast: json["cast"] == null ? [] : List<Cast>.from(json["cast"]!.map((x) => Cast.fromMap(x))),
        crew: json["crew"] == null ? [] : List<Cast>.from(json["crew"]!.map((x) => Cast.fromMap(x))),
    );

    
}

