// To parse this JSON data, do
//
//     final moviesApiModel = moviesApiModelFromJson(jsonString);

import 'dart:convert';

List<MoviesApiModel> moviesApiModelFromJson(String str) =>
    List<MoviesApiModel>.from(
        json.decode(str).map((x) => MoviesApiModel.fromJson(x)));

String moviesApiModelToJson(List<MoviesApiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MoviesApiModel {
  final int? id;
  final String? movie;
  final double? rating;
  final String? image;
  final String? imdbUrl;

  MoviesApiModel({
    this.id,
    this.movie,
    this.rating,
    this.image,
    this.imdbUrl,
  });

  factory MoviesApiModel.fromJson(Map<String, dynamic> json) => MoviesApiModel(
        id: json["id"],
        movie: json["movie"],
        rating: json["rating"]?.toDouble(),
        image: json["image"],
        imdbUrl: json["imdb_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "movie": movie,
        "rating": rating,
        "image": image,
        "imdb_url": imdbUrl,
      };
}
