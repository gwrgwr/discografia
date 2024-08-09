import 'dart:io';

import 'package:discografia/bloc/artista_bloc.dart';
import 'package:discografia/services/api_handler.dart';
import 'package:discografia/services/http_overrides.dart';
import 'package:discografia/theme/theme.dart';
import 'package:discografia/theme/util.dart';
import 'package:discografia/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  final _apiHandler = ApiHandler();
  runApp(
    BlocProvider(
      create: (context) => ArtistaBloc(_apiHandler),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme =
        createTextTheme(context, "Roboto Serif", "Roboto Mono");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: HomePage(bloc: BlocProvider.of<ArtistaBloc>(context)),
    );
  }
}
