import 'package:bloc/bloc.dart';
import 'package:discografia/bloc/artista_event.dart';
import 'package:discografia/bloc/artista_state.dart';
import 'package:discografia/services/api_handler.dart';

class ArtistaBloc extends Bloc<ArtistaEvent, ArtistaState> {
  final ApiHandler _apiHandler;
  ArtistaBloc(this._apiHandler) : super(ArtistaInitial()) {
    on<GetArtista>((event, emit) async {
      final lista = await _apiHandler.fetchArtista();
      emit(ArtistaSuccess(lista: lista));
    });

    on<PostArtista>((event, emit) async {
      await _apiHandler.postArtista(event.artistaModel);
      add(GetArtista());
    });

    on<DeleteArtista>((event, emit) async {
      await _apiHandler.deleteArtista(event.id);
      add(GetArtista());
    });

    on<UpdateArtista>((event, emit) async {
      await _apiHandler.putArtista(event.artistaModel, event.id);
      add(GetArtista());
    });
  }
}
