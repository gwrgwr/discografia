import 'package:bloc/bloc.dart';
import 'package:discografia/models/musica_model.dart';
import 'package:discografia/services/api_handler.dart';
import 'package:meta/meta.dart';

part 'music_event.dart';
part 'music_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final ApiHandler _apiHandler;
  MusicBloc(this._apiHandler) : super(MusicInitial()) {
    on<GetMusic>((event, emit) async {
      final list = await _apiHandler.fetchMusicas();
      emit(MusicSuccess(list: list));
    });

    on<DeleteMusic>((event, emit) async {
      _apiHandler.deleteMusica(event.id);
      add(GetMusic());
    });

    on<AddMusic>((event, emit) async {
      _apiHandler.postMusica(event.musicaModel);
      add(GetMusic());
    });

    on<UpdateMusic>((event, emit) async {
      _apiHandler.updateMusica(event.musicaModel.musicaId!, event.musicaModel);
    });
  }
}
