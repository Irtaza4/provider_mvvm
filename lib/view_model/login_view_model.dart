
import 'package:flutter/widgets.dart';

class LoginViewModel extends ChangeNotifier{

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailNode = FocusNode();
  final _passwordNode = FocusNode();
  bool _visible = false;

  TextEditingController get emailController =>_emailController;
  TextEditingController get passwordController =>_passwordController;
  FocusNode get emailNode => _emailNode;
  FocusNode get passwordNode => _passwordNode;
  bool get visible =>_visible;
  void visibility(){
    _visible =! _visible;
    notifyListeners();
  }


}