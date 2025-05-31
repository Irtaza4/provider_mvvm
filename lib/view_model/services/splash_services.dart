
import 'package:flutter/cupertino.dart';
import 'package:mvvm_provider/model/user_model.dart';
import 'package:mvvm_provider/view_model/user_view_model.dart';

import '../../utils/routes/route_names.dart';

class SplashServices{

  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context){
    getUserData().then((value)async{
      if(value.token== 'null' || value.token == ''){
       await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RouteNames.loginScreen);
      }
      else{
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RouteNames.homeScreen);
      }
    }).onError((error,stackTrace){
      print(error.toString());
    });
  }

}