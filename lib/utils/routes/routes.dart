
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_provider/utils/routes/route_names.dart';
import 'package:mvvm_provider/view/home_screen.dart';
import 'package:mvvm_provider/view/login_screen.dart';
import 'package:mvvm_provider/view/splash_view.dart';

import '../../view/singup_view.dart';

class Routes{

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (BuildContext context)=>SplashView());
      case RouteNames.loginScreen:
        return MaterialPageRoute(builder: (BuildContext context)=>LoginScreen());
      case RouteNames.homeScreen:
        return MaterialPageRoute(builder: (BuildContext context)=>HomeScreen());
      case RouteNames.signupScreen:
        return MaterialPageRoute(builder: (BuildContext context)=>SingupView());
      default:
        return MaterialPageRoute(builder: (_)=>Scaffold(
          body: Center(child: Text('No Routes defined'),),
        ));
    }

  }

}