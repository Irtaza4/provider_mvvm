
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_provider/repository/login_repository.dart';

class AuthViewModel with ChangeNotifier{
  final _repo = LoginRepository();

  Future<dynamic> loginApi(dynamic data)async{
    _repo.loginApi(data).then((value){
      if(kDebugMode){
        print('api hit ${value.toString()}');
      }

    }).onError((error,stackTrace){
     if(kDebugMode){
       print('errror $error');
     }

    });
  }


}