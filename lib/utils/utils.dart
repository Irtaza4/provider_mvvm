
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{

  static void changeFocus(BuildContext context,FocusNode currentFocus,FocusNode next){
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(next);
  }
  static toastMessage(String message){

    Fluttertoast.showToast(
        msg: message);
  }
  static flushBarMessage(String message, BuildContext context){
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          duration: Duration(seconds: 2),
        )..show(context)
    );

  }

}