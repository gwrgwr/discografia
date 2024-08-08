import 'package:discografia/models/artista_model.dart';

class ArtistaEvent {}

final class GetArtista extends ArtistaEvent {}

final class UpdateArtista extends ArtistaEvent {
  final ArtistaModel artistaModel;
  final int id;

  UpdateArtista({required this.artistaModel, required this.id});
}

final class PostArtista extends ArtistaEvent {
  final ArtistaModel artistaModel;

  PostArtista({required this.artistaModel});
}

final class DeleteArtista extends ArtistaEvent {
  final int id;

  DeleteArtista({required this.id});
}

