import 'package:app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LoginWidget(onCickedSignUp: toggle)
      : SignUpWidget(onCickedSignIn: toggle);
  void toggle() => setState(() => isLogin = !isLogin);
}
