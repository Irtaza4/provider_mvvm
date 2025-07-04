
import 'package:flutter/material.dart';
import 'package:mvvm_provider/view_model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}


class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.checkAuthentication(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text('Splash Screen',style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),))
      ],
    ),
    );
  }
}
