
import 'package:mvvm_provider/data/network/base_api_service.dart';
import 'package:mvvm_provider/data/network/network_api_service.dart';
import 'package:mvvm_provider/res/components/app_url.dart';

class LoginRepository{
  BaseApiService _apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data)async{
    try{
     dynamic response = await _apiService.getPostApiResponse(AppUrl.loginEndpoint, data);
     return response;
    }
    catch(e){
      throw e;
    }
  }

}