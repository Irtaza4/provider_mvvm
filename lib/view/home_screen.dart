
import 'package:flutter/material.dart';
import 'package:mvvm_provider/utils/routes/route_names.dart';
import 'package:mvvm_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserViewModel>(context);
    return Scaffold(
    appBar: AppBar(
      title: Text('Home  screen'),
      centerTitle: true,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(onPressed: (){
          provider.remove().then((value){
            Navigator.pushNamed(context, RouteNames.loginScreen);
          });

        }, icon: Icon(Icons.logout))
      ],
    ),
    );
  }
}
