part of 'music_bloc.dart';

@immutable
sealed class MusicState {}

final class MusicInitial extends MusicState {}
final class MusicLoading extends MusicState {}
final class MusicSuccess extends MusicState {
  final List<MusicaModel> list;

  MusicSuccess({required this.list});

}
final class MusicError extends MusicState {
  final String message;

  MusicError({required this.message});
}
