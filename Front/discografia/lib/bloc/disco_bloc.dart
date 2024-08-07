import 'package:bloc/bloc.dart';
import 'package:discografia/models/musica_model.dart';
import 'package:discografia/services/api_handler.dart';
import 'package:meta/meta.dart';

part 'disco_event.dart';
part 'disco_state.dart';

class DiscoBloc extends Bloc<DiscoEvent, DiscoState> {
  final ApiHandler _apiHandler;
  DiscoBloc(this._apiHandler) : super(DiscoInitial()) {
    on<DiscoGetMusic>((event, emit) async {
      final list = await _apiHandler.fetchMusicas();
      emit(DiscoSuccess(list: list));
    });

    on<DiscoDeleteMusic>((event, emit) async {
      _apiHandler.deleteMusica(event.id);
      add(DiscoGetMusic());
    });

    on<DiscoAddMusic>((event, emit) async {
      _apiHandler.postMusica(event.musicaModel);
      add(DiscoGetMusic());
    });

    on<DiscoUpdateMusic>((event, emit) async {
      _apiHandler.updateMusica(event.musicaModel.musicaId!, event.musicaModel);
    });
  }
}
