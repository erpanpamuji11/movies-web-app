import 'dart:convert';

MovieList movieListFromMap(String str) => MovieList.fromMap(json.decode(str));

String movieListToMap(MovieList data) => json.encode(data.toMap());

class MovieList {
  Dates dates;
  int page;
  List<Movies> movies;
  int totalPages;
  int totalMovies;

  MovieList({
    required this.dates,
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalMovies,
  });

  factory MovieList.fromMap(Map<String, dynamic> json) => MovieList(
        dates: Dates.fromMap(json["dates"]),
        page: json["page"],
        movies:
            List<Movies>.from(json["movies"].map((x) => Movies.fromMap(x))),
        totalPages: json["total_pages"],
        totalMovies: json["total_movies"],
      );

  Map<String, dynamic> toMap() => {
        "dates": dates.toMap(),
        "page": page,
        "movies": List<dynamic>.from(movies.map((x) => x.toMap())),
        "total_pages": totalPages,
        "total_movies": totalMovies,
      };
}

class Dates {
  DateTime maximum;
  DateTime minimum;

  Dates({
    required this.maximum,
    required this.minimum,
  });

  factory Dates.fromMap(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
      );

  Map<String, dynamic> toMap() => {
        "maximum":
            "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum":
            "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
      };
}

class Movies {



  String posterPath;
  DateTime releaseDate;
  String title;
  double voteAverage;

  Movies({


    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,

  });

  factory Movies.fromMap(Map<String, dynamic> json) => Movies(


 

        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
    
        voteAverage: json["vote_average"]?.toDouble(),

      );

  Map<String, dynamic> toMap() => {
        "poster_path": posterPath,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,

        "vote_average": voteAverage,
  
      };
}

enum OriginalLanguage { EN, FR, JA, KO }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "fr": OriginalLanguage.FR,
  "ja": OriginalLanguage.JA,
  "ko": OriginalLanguage.KO
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
