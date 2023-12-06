import 'package:flutter/material.dart';
import 'package:login_apps/bloc/cart.dart';
import 'package:login_apps/presentation/home_page.dart';
import 'package:login_apps/presentation/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  // final string
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        initialRoute: '/login',
        routes: <String, WidgetBuilder>{
          '/home': (context) => const HomePage(),
          '/login': (context) => const LoginPage(),
        },
        home: Scaffold(
          body: Center(
            child: Text("Alo"),
          ),
        ),
      ),
    );
  }
}
