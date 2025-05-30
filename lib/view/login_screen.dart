import 'package:flutter/material.dart';
import 'package:mvvm_provider/utils/utils.dart';
import 'package:mvvm_provider/view_model/auth_view_model.dart';
import 'package:mvvm_provider/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

import '../res/components/app_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height*1;
    final provider = Provider.of<LoginViewModel>(context);
    final provider2 = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title:Text('Login Screen',style: TextStyle(
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
            AppButton(loading: false,text: 'Login',onTap: (){
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
              provider2.loginApi(data);
            },)
          ],
        ),
      ),

    );
  }
}
