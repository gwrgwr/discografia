// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:discografia/models/musica_model.dart';

class ArtistaModel {
  final int? artistaId;
  final String nome;
  final int idade;
  final int qtdeMusica;
  final List<MusicaModel>? musicasArtista;
  ArtistaModel({
    required this.artistaId,
    required this.nome,
    required this.idade,
    required this.qtdeMusica,
    required this.musicasArtista,
  });

  ArtistaModel copyWith({
    int? artistaId,
    String? nome,
    int? idade,
    int? qtdeMusica,
    List<MusicaModel>? musicasArtista,
  }) {
    return ArtistaModel(
      artistaId: artistaId ?? this.artistaId,
      nome: nome ?? this.nome,
      idade: idade ?? this.idade,
      qtdeMusica: qtdeMusica ?? this.qtdeMusica,
      musicasArtista: musicasArtista ?? this.musicasArtista,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'artistaId': artistaId,
      'nome': nome,
      'idade': idade,
      'qtdeMusica': qtdeMusica,
      'musicasArtista': musicasArtista!.map((x) => x.toMap()).toList(),
    };
  }

  factory ArtistaModel.fromMap(Map<String, dynamic> map) {
    return ArtistaModel(
      artistaId: map['artistaId'] != null ? map['artistaId'] as int : null,
      nome: map['nome'] as String,
      idade: map['idade'] as int,
      qtdeMusica: map['qtdeMusica'] as int,
      musicasArtista: map['musicasArtista'] != null ? List<MusicaModel>.from((map['musicasArtista'] as List<int>).map<MusicaModel?>((x) => MusicaModel.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ArtistaModel.fromJson(String source) => ArtistaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ArtistaModel(artistaId: $artistaId, nome: $nome, idade: $idade, qtdeMusica: $qtdeMusica, musicasArtista: $musicasArtista)';
  }

  @override
  bool operator ==(covariant ArtistaModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.artistaId == artistaId &&
      other.nome == nome &&
      other.idade == idade &&
      other.qtdeMusica == qtdeMusica &&
      listEquals(other.musicasArtista, musicasArtista);
  }

  @override
  int get hashCode {
    return artistaId.hashCode ^
      nome.hashCode ^
      idade.hashCode ^
      qtdeMusica.hashCode ^
      musicasArtista.hashCode;
  }
}
