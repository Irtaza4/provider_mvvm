
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_provider/repository/login_repository.dart';
import 'package:mvvm_provider/utils/routes/route_names.dart';
import 'package:mvvm_provider/utils/utils.dart';

class AuthViewModel with ChangeNotifier{
  final _repo = LoginRepository();
  bool _loading = false;
  bool get loading => _loading;
  bool _signupLoading = false;
  bool get signUpLoading =>_signupLoading;
  void getLoading(bool value){
    _loading = value;
    notifyListeners();
  }
  void getsigUpLoading(bool value){
    _signupLoading = value;
    notifyListeners();
  }
  Future<dynamic> loginApi(BuildContext context,dynamic data)async{
    getLoading(true);
    await _repo.loginApi(data).then((value){
      if(kDebugMode){
        print('api hit ${value.toString()}'
        );
        getLoading(false);
        Navigator.pushNamed(context, RouteNames.homeScreen);
        Utils.toastMessage('Login Successful',Colors.green);
      }

    }).onError((error,stackTrace){
     if(kDebugMode){
       print('errror $error');
     }
     getLoading(false);
     Utils.toastMessage('login failed',Colors.red);
    });
  }
  Future<dynamic> signUpApi(BuildContext context,dynamic data)async{
    getsigUpLoading(true);
    await _repo.signUpApi(data).then((value){
      if(kDebugMode){
        print('api hit ${value.toString()}'
        );
        getsigUpLoading(false);
        Navigator.pushNamed(context, RouteNames.homeScreen);
        Utils.toastMessage('signup Successful',Colors.green);
      }

    }).onError((error,stackTrace){
      if(kDebugMode){
        print('errror $error');
      }
      getsigUpLoading(false);
      Utils.toastMessage('login failed',Colors.red);
    });
  }


}