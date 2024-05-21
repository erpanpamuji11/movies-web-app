import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movies_web_app/core/models/movie_list/movie_list.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final dio = Dio();

  @observable
  ObservableList<Movies> moviesNowPlaying = ObservableList<Movies>();

  @observable
  ObservableList<Movies> moviesPopular = ObservableList<Movies>();

  @observable
  ObservableList<Movies> moviesUpComing = ObservableList<Movies>();

  @action
  Future getMovieNowPlaying() async {
    debugPrint("hallo");
    Dio dio = Dio();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers["Authorization"] =
              "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyM2ZmMTc0MzBhMTkzMmIxZTAxMGQxZmUzYzc0NWRkNyIsInN1YiI6IjY1YzYzZGNmMWM2YWE3MDE2NDk5ZDkwYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.guVumKiMgxtAFuR_sIXRGCLz7aKZVrDexyE-aA0obB4";
          return handler.next(options);
        },
      ),
    );
    try {
      final response = await dio.get(
          "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1");
      if (response.statusCode == 200) {
        var data = response.data['results'] as List;

        final datum = data.map((e) => Movies.fromMap(e)).toList();
        moviesNowPlaying.clear();
        moviesNowPlaying.addAll(datum);
      } else {
        debugPrint("failed get data");
      }
    } on DioException catch (e) {
      debugPrint("failed get data $e");
    }
  }

  @action
  Future getMoviePopular() async {
    debugPrint("hallo");
    Dio dio = Dio();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers["Authorization"] =
              "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyM2ZmMTc0MzBhMTkzMmIxZTAxMGQxZmUzYzc0NWRkNyIsInN1YiI6IjY1YzYzZGNmMWM2YWE3MDE2NDk5ZDkwYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.guVumKiMgxtAFuR_sIXRGCLz7aKZVrDexyE-aA0obB4";
          return handler.next(options);
        },
      ),
    );
    try {
      final response = await dio.get(
          "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1");
      if (response.statusCode == 200) {
        var data = response.data['results'] as List;

        final datum = data.map((e) => Movies.fromMap(e)).toList();
        moviesPopular.clear();
        moviesPopular.addAll(datum);
      } else {
        debugPrint("failed get data");
      }
    } on DioException catch (e) {
      debugPrint("failed get data $e");
    }
  }

  @action
  Future getMovieUpcoming() async {
    debugPrint("hallo");
    Dio dio = Dio();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers["Authorization"] =
              "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyM2ZmMTc0MzBhMTkzMmIxZTAxMGQxZmUzYzc0NWRkNyIsInN1YiI6IjY1YzYzZGNmMWM2YWE3MDE2NDk5ZDkwYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.guVumKiMgxtAFuR_sIXRGCLz7aKZVrDexyE-aA0obB4";
          return handler.next(options);
        },
      ),
    );
    try {
      final response = await dio.get(
          "https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1");
      if (response.statusCode == 200) {
        var data = response.data['results'] as List;

        final datum = data.map((e) => Movies.fromMap(e)).toList();
        moviesUpComing.clear();
        moviesUpComing.addAll(datum);
      } else {
        debugPrint("failed get data");
      }
    } on DioException catch (e) {
      debugPrint("failed get data $e");
    }
  }
}
