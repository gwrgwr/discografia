import 'dart:io';

import 'package:discografia/bloc/artista_bloc.dart';
import 'package:discografia/services/api_handler.dart';
import 'package:discografia/services/http_overrides.dart';
import 'package:discografia/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArtistaBloc(ApiHandler()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage(
          bloc: ArtistaBloc(ApiHandler()),
        ),
      ),
    );
  }
}
