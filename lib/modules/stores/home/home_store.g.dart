// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$moviesNowPlayingAtom =
      Atom(name: 'HomeStoreBase.moviesNowPlaying', context: context);

  @override
  ObservableList<Movies> get moviesNowPlaying {
    _$moviesNowPlayingAtom.reportRead();
    return super.moviesNowPlaying;
  }

  @override
  set moviesNowPlaying(ObservableList<Movies> value) {
    _$moviesNowPlayingAtom.reportWrite(value, super.moviesNowPlaying, () {
      super.moviesNowPlaying = value;
    });
  }

  late final _$moviesPopularAtom =
      Atom(name: 'HomeStoreBase.moviesPopular', context: context);

  @override
  ObservableList<Movies> get moviesPopular {
    _$moviesPopularAtom.reportRead();
    return super.moviesPopular;
  }

  @override
  set moviesPopular(ObservableList<Movies> value) {
    _$moviesPopularAtom.reportWrite(value, super.moviesPopular, () {
      super.moviesPopular = value;
    });
  }

  late final _$moviesUpComingAtom =
      Atom(name: 'HomeStoreBase.moviesUpComing', context: context);

  @override
  ObservableList<Movies> get moviesUpComing {
    _$moviesUpComingAtom.reportRead();
    return super.moviesUpComing;
  }

  @override
  set moviesUpComing(ObservableList<Movies> value) {
    _$moviesUpComingAtom.reportWrite(value, super.moviesUpComing, () {
      super.moviesUpComing = value;
    });
  }

  late final _$getMovieNowPlayingAsyncAction =
      AsyncAction('HomeStoreBase.getMovieNowPlaying', context: context);

  @override
  Future<dynamic> getMovieNowPlaying() {
    return _$getMovieNowPlayingAsyncAction
        .run(() => super.getMovieNowPlaying());
  }

  late final _$getMoviePopularAsyncAction =
      AsyncAction('HomeStoreBase.getMoviePopular', context: context);

  @override
  Future<dynamic> getMoviePopular() {
    return _$getMoviePopularAsyncAction.run(() => super.getMoviePopular());
  }

  late final _$getMovieUpcomingAsyncAction =
      AsyncAction('HomeStoreBase.getMovieUpcoming', context: context);

  @override
  Future<dynamic> getMovieUpcoming() {
    return _$getMovieUpcomingAsyncAction.run(() => super.getMovieUpcoming());
  }

  @override
  String toString() {
    return '''
moviesNowPlaying: ${moviesNowPlaying},
moviesPopular: ${moviesPopular},
moviesUpComing: ${moviesUpComing}
    ''';
  }
}
