import 'package:api/cubit/Cubit/All_Cubit_Classes.dart';
import 'package:api/screens/Product_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => All_Cubit_Classes()..FetchProduct(), // Initialize and fetch products
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProductScreen(),
    );
  }
}
