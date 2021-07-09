import 'package:flutter/material.dart';
import 'package:projetofinal/pages/tela_login.dart';
import 'package:projetofinal/pages/user_form.dart';
import 'package:projetofinal/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginPage(),
      routes: {
        AppRoutes.USER_FORM: (_) => UserForm(),
      },
    );
  }
}