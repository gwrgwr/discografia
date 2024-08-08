part of 'music_bloc.dart';

@immutable
sealed class MusicEvent {}

final class GetMusic extends MusicEvent {}

final class AddMusic extends MusicEvent {
  final MusicaModel musicaModel;

  AddMusic({required this.musicaModel});
}

final class UpdateMusic extends MusicEvent {
  final MusicaModel musicaModel;

  UpdateMusic({required this.musicaModel});
}

final class DeleteMusic extends MusicEvent {
  final int id;

  DeleteMusic({required this.id});
}
