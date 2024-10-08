import 'dart:io';

import 'package:discografia/bloc/artista_bloc.dart';
import 'package:discografia/bloc/artista_event.dart';
import 'package:discografia/models/artista_model.dart';
import 'package:flutter/material.dart';

class CreateArtist extends StatelessWidget {
  CreateArtist({required this.bloc, super.key});
  final ArtistaBloc bloc;
  final TextEditingController nomeArtista = TextEditingController();
  final TextEditingController idadeArtista = TextEditingController();
  final TextEditingController qtdeMusicaArtista = TextEditingController();
  final TextEditingController imgUrlArtista = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Artista"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Nome",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: nomeArtista,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Idade",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: idadeArtista,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Quantidade de músicas",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: qtdeMusicaArtista,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) ...[
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "URL da imagem",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: imgUrlArtista,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ] else ...[
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Quantidade de músicas",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: imgUrlArtista,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ]
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ArtistaModel artistaModel = ArtistaModel(
            nome: nomeArtista.text,
            idade: int.parse(idadeArtista.text),
            qtdeMusica: int.parse(qtdeMusicaArtista.text),
            imgUrl: imgUrlArtista.text,
          );
          bloc.add(PostArtista(artistaModel: artistaModel));
          nomeArtista.clear();
          idadeArtista.clear();
          qtdeMusicaArtista.clear();
          imgUrlArtista.clear();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Artista adicionado com sucesso!',
              ),
            ),
          );
        },
      ),
    );
  }
}
