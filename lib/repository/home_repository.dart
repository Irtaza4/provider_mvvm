
import 'package:mvvm_provider/data/network/base_api_service.dart';
import 'package:mvvm_provider/data/network/network_api_service.dart';
import 'package:mvvm_provider/model/movie_model.dart';
import 'package:mvvm_provider/res/components/app_url.dart';

class HomeRepository{

  BaseApiService _apiService = NetworkApiService();

  Future<MovieModel> fetchMovieData()async{

    try{
      dynamic response = await _apiService.getGetApiResponse(AppUrl.moviePopularEndpoint);
      print("API raw response: $response");
      return response = MovieModel.fromJson(response);
    }catch(e){
      throw(e);
    }


  }


}