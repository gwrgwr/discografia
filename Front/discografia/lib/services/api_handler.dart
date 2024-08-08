import 'dart:convert';

import 'package:discografia/models/artista_model.dart';
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
    final uri = Uri.parse("https://localhost:7107/Musica/$id");
    try {
      http.delete(uri,
          headers: {"Content-Type": "application/json; charset=UTF-8"});
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateMusica(int id, MusicaModel musica) async {
    final uri = Uri.parse("https://localhost:7107/Musica/$id");
    try {
      http.put(
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

  // Artista

  Future<List<ArtistaModel>> fetchArtista() async {
    final uri = Uri.parse("https://localhost:7107/Artista");
    List<ArtistaModel> lista = [];
    try {
      final response = await http.get(uri);
      final body = jsonDecode(response.body) as List;
      lista = body.map((e) => ArtistaModel.fromMap(e)).toList();
    } catch (e) {
      print(e);
    }
    return lista;
  }

  Future<void> postArtista(ArtistaModel artista) async {
    final uri = Uri.parse("https://localhost:7107/Artista");
    try {
      http.post(
        uri,
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: jsonEncode({
          "nome": artista.nome,
          "idade": artista.idade,
          "qtdeMusica": artista.qtdeMusica,
        }),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> putArtista(ArtistaModel artista, int id) async {
    final uri = Uri.parse("https://localhost:7101/Artista/$id");
    try {
      http.put(uri, headers: {
        "Content-type": "application/json; charset=UTF-8",
      }, body: {
        "artistaId": id,
        "nome": artista.nome,
        "idade": artista.idade,
        "qtdeMusica": artista.qtdeMusica,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteArtista(int id) async {
    final uri = Uri.parse("https://localhost:7107/Artista/$id");
    try {
      http.delete(uri, headers: {
        "Content-type": "application/json; charset=UTF-8",
      });
    } catch (e) {
      print(e);
    }
  }
}
