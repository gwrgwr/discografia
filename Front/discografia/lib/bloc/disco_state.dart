part of 'disco_bloc.dart';

@immutable
sealed class DiscoState {}

final class DiscoInitial extends DiscoState {}
final class DiscoLoading extends DiscoState {}
final class DiscoSuccess extends DiscoState {
  final List<MusicaModel> list;

  DiscoSuccess({required this.list});

}
final class DiscoError extends DiscoState {
  final String message;

  DiscoError({required this.message});
}
