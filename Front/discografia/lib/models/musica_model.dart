// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MusicaModel {
  final int? musicaId;
  final String nome;
  final String duracao;
  final int artistaId;
  final String genero;
  MusicaModel({
    this.musicaId,
    required this.nome,
    required this.duracao,
    required this.artistaId,
    required this.genero,
  });

  MusicaModel copyWith({
    int? musicaId,
    String? nome,
    String? duracao,
    int? artistaId,
    String? genero,
  }) {
    return MusicaModel(
      musicaId: musicaId ?? this.musicaId,
      nome: nome ?? this.nome,
      duracao: duracao ?? this.duracao,
      artistaId: artistaId ?? this.artistaId,
      genero: genero ?? this.genero,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'musicaId': musicaId,
      'nome': nome,
      'duracao': duracao,
      'artistaId': artistaId,
      'genero': genero,
    };
  }

  factory MusicaModel.fromMap(Map<String, dynamic> map) {
    return MusicaModel(
      musicaId: map['musicaId'] != null ? map['musicaId'] as int : null,
      nome: map['nome'] as String,
      duracao: map['duracao'] as String,
      artistaId: map['artistaId'] as int,
      genero: map['genero'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MusicaModel.fromJson(String source) => MusicaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MusicaModel(musicaId: $musicaId, nome: $nome, duracao: $duracao, artistaId: $artistaId, genero: $genero)';
  }

  @override
  bool operator ==(covariant MusicaModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.musicaId == musicaId &&
      other.nome == nome &&
      other.duracao == duracao &&
      other.artistaId == artistaId &&
      other.genero == genero;
  }

  @override
  int get hashCode {
    return musicaId.hashCode ^
      nome.hashCode ^
      duracao.hashCode ^
      artistaId.hashCode ^
      genero.hashCode;
  }
}
