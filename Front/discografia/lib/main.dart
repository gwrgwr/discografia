import 'dart:io';

import 'package:discografia/models/musica_model.dart';
import 'package:discografia/services/api_handler.dart';
import 'package:discografia/services/http_overrides.dart';
import 'package:flutter/material.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final apiHandler = ApiHandler();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await apiHandler.fetchMusicas();
      await apiHandler.postMusica(MusicaModel(nome: "test", duracao: "3:27", artistaId: 1));
      await apiHandler.deleteMusica(3);
    },);
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(),
    );
  }
}