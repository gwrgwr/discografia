part of 'disco_bloc.dart';

@immutable
sealed class DiscoEvent {}

final class DiscoGetMusic extends DiscoEvent {}

final class DiscoAddMusic extends DiscoEvent {
  final MusicaModel musicaModel;

  DiscoAddMusic({required this.musicaModel});
}

final class DiscoUpdateMusic extends DiscoEvent {
  final MusicaModel musicaModel;

  DiscoUpdateMusic({required this.musicaModel});
}

final class DiscoDeleteMusic extends DiscoEvent {
  final int id;

  DiscoDeleteMusic({required this.id});
}
