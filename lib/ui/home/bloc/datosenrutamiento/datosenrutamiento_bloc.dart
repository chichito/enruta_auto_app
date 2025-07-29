import 'dart:async';

import 'package:enruta_auto_app/ui/data/repository/post_repository.dart';
import 'package:enruta_auto_app/ui/home/model/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'datosenrutamiento_event.dart';
part 'datosenrutamiento_state.dart';

class DatosEnrutamientoBloc
    extends Bloc<DatosEnrutamientoEvent, DatosEnrutamientoState> {
  /*
  final PostRepository _repository;

  DatosEnrutamientoBloc(this._repository) : super(DatosEnrutamientoInitial()) {
    on<FetchPosts>(_onFetchPosts);
  }
*/
  //final _repository = PostRepository(apiUrl: "https://dummyjson.com/posts");
  var _repository = PostRepository(apiUrl: '');
  Timer? timer;
  final String sUrl;
  DatosEnrutamientoBloc(this.sUrl) : super(DatosEnrutamientoInitial()) {
    // Initialize the repository with the global API URL

    _repository = PostRepository(apiUrl: sUrl);

    on<IniciarTemporizador>((event, emit) {
      timer = Timer.periodic(const Duration(seconds: 10), (timer) {
        add(GetEstado());
      });
    });
    // on<FetchPosts>(_onFetchPosts);
    on<GetEstado>(_onGetEstado);
    on<GrabarDatosEnrutar>(_onGrabarDatosEnrutar);
    on<GrabarDatosNormal>(_onGrabarDatosNormal);
  }

  @override
  Future<void> close() {
    // Cancel any ongoing timers or streams if necessary
    timer?.cancel();
    return super.close();
  }

  FutureOr<void> _onGetEstado(
    GetEstado event,
    Emitter<DatosEnrutamientoState> emit,
  ) async {
    try {
      emit(DatosEnrutamientoLoading());
      String data = await _repository.getEstado();
      emit(DatosEnrutamientoLoaded(data: data));
    } catch (e) {
      emit(DatosEnrutamientoError(message: e.toString()));
    }
  }

  FutureOr<void> _onGrabarDatosEnrutar(
    GrabarDatosEnrutar event,
    Emitter<DatosEnrutamientoState> emit,
  ) {
    // Handle the GrabarDatosEnrutar event
    final String ping = event.ping;
    print(ping);
    //emit(DatosEnrutamientoInitial()); // Emit an initial state or any other relevant state
  }

  FutureOr<void> _onGrabarDatosNormal(
    GrabarDatosNormal event,
    Emitter<DatosEnrutamientoState> emit,
  ) {
    // Handle the GrabarDatosNormal event
    final String ping = event.ping;
    final String sAutorizacion = event.sAutorizacion;
    final String sObservaciones = event.sObservaciones;

    print(ping);
    print(sAutorizacion);
    print(sObservaciones);
    //emit(DatosenrutamientoInitial()); // Emit an initial state or any other relevant state
  }

  /*
  Future<void> _onFetchPosts(
    FetchPosts event,
    Emitter<DatosEnrutamientoState> emit,
  ) async {
    try {
      emit(DatosEnrutamientoLoading());
      List<Post> data = await _repository.fetchPosts();
      emit(DatosfetchPostsLoaded(posts: data));
    } catch (e) {
      emit(DatosEnrutamientoError(message: e.toString()));
    }
  }
*/
}
