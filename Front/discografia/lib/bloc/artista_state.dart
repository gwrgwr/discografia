import 'package:discografia/models/artista_model.dart';

sealed class ArtistaState {}

final class ArtistaInitial extends ArtistaState {}

final class ArtistaLoading extends ArtistaState {}

final class ArtistaSuccess extends ArtistaState {
  final List<ArtistaModel> lista;

  ArtistaSuccess({required this.lista});
}

final class ArtistaErro extends ArtistaState {
  final String message;

  ArtistaErro({required this.message});
}