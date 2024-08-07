import 'dart:convert';

import 'package:discografia/models/musica_model.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  // Musica
  Future<List<MusicaModel>> fetchMusicas() async {
    final uri = Uri.parse("https://localhost:7107/Musica");
    List<MusicaModel> list = [];
    try {
      final response = await http.get(uri);
      final body = jsonDecode(response.body) as List;
      list = body
          .map(
            (e) => MusicaModel.fromMap(e),
          )
          .toList();
    } catch (e) {
      print(e.toString());
    }
    print(list);
    return list;
  }

  Future<void> postMusica(MusicaModel musica) async {
    final uri = Uri.parse("https://localhost:7107/Musica");
    try {
      final response = await http.post(
        uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "nome": musica.nome,
          "duracao": musica.duracao,
          "artistaId": musica.artistaId,
        }),
      );
      print(response.body);
    } catch (e) {
      print(e.toString());
      print(e);
    }
  }

  Future<void> deleteMusica(int id) async {
    final uri = Uri.parse("https://localhost:7107/Musica/${id}");
    try {
      final response = http.delete(uri,
          headers: {"Content-Type": "application/json; charset=UTF-8"});
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateMusica(int id, MusicaModel musica) async {
    final uri = Uri.parse("https://localhost:7107/Musica/${id}");
    try {
      final response = http.put(
        uri,
        headers: {"Content-type": "application/json; charset=UTF8"},
        body: {
          "musicaId": id,
          "nome": musica.nome,
          "duracao": musica.duracao,
          "artistaId": musica.artistaId,
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
