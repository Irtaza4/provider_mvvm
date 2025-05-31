
import 'dart:convert';
import 'dart:io';

import 'package:mvvm_provider/data/app_exceptions.dart';
import 'package:mvvm_provider/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;
class NetworkApiService extends BaseApiService{

  @override
  Future<dynamic> getGetApiResponse(String url)async{
    dynamic jsonResponse;
    try{
      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    }on SocketException{
      throw FetchDataException('No internet connection');
    }
    return jsonResponse;
  }

  @override
  Future<dynamic> getPostApiResponse(String url, dynamic data) async {
    dynamic jsonResponse;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'x-api-key': 'reqres-free-v1',
        },
        body: jsonEncode(data),
      ).timeout(Duration(seconds: 10));

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return jsonResponse;
  }


  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException('error occured during communicationg '
            +'with the status code'+response.statusCode.toString());
    }
  }

}