

import 'package:flutter/material.dart';
import 'package:mvvm_provider/model/movie_model.dart';
import 'package:mvvm_provider/repository/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final _repo = HomeRepository();
  MovieModel? _movieData;
  MovieModel? get movieData => _movieData;

  Future<void> fetchMovieData() async {
    try {
      final value = await _repo.fetchMovieData();
      print('api hit $value');
      _movieData = value;
      notifyListeners();
    } catch (error) {
      print('error $error');
    }
  }
}
