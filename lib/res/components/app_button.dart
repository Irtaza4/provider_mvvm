

import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  bool loading;
   AppButton({super.key,required this.text,required this.onTap,required this.loading});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 60,vertical: 10),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Text(text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
      ),
    );
  }
}
