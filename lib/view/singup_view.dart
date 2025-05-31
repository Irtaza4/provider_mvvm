
import 'package:flutter/material.dart';
import 'package:mvvm_provider/utils/routes/route_names.dart';
import 'package:provider/provider.dart';

import '../res/components/app_button.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';
import '../view_model/login_view_model.dart';

class SingupView extends StatelessWidget {
  const SingupView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height*1;
    final provider = Provider.of<LoginViewModel>(context);
    final provider2 = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title:Text('Signup Screen',style: TextStyle(
            color: Colors.white
        ),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: provider.emailController,
              focusNode: provider.emailNode,
              keyboardType: TextInputType.emailAddress,

              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email_outlined,color: Colors.blue,),

              ),
              onFieldSubmitted: (value){
                Utils.changeFocus(context, provider.emailNode, provider.passwordNode);
              },
            ),
            SizedBox(
              height: height*0.03,
            ),
            TextFormField(
              controller: provider.passwordController,
              focusNode: provider.passwordNode,
              keyboardType: TextInputType.visiblePassword,
              obscureText: provider.visible,

              decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_open_outlined,color: Colors.blue,),
                  suffixIcon: IconButton(onPressed: (){
                    provider.visibility();
                  }, icon: Icon(provider.visible?Icons.visibility_off:Icons.visibility),color: Colors.blue,)
              ),
            ),
            SizedBox(
              height: height*0.03,
            ),
            AppButton(loading: provider2.signUpLoading,text: 'Signup',onTap: (){
              if(provider.emailController.text.isEmpty){
                Utils.flushBarMessage('Enter Email', context);
              }
              else if(provider.passwordController.text.isEmpty){
                Utils.flushBarMessage('Enter password', context);
              }
              else if(provider.passwordController.text.length < 6){
                Utils.flushBarMessage('password cannot be less then 6 number', context);
              }
              Map data={
                "email": provider.emailController.text,
                "password": provider.passwordController.text
              };
              provider2.signUpApi(context,data);
            },),
            SizedBox(
              height: height*0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:

              [
                Text("Already have an account?"),
                TextButton(onPressed: (){
                  Navigator.pushNamed(context, RouteNames.loginScreen);
                }, child: Text('Login',style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold
                ),))
              ],)
          ],
        ),
      ),

    );
  }
}
