import 'dart:async';

import 'package:enruta_auto_app/ui/data/repository/post_repository.dart';
import 'package:enruta_auto_app/ui/home/model/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'datosenrutamiento_event.dart';
part 'datosenrutamiento_state.dart';

class DatosenrutamientoBloc
    extends Bloc<DatosenrutamientoEvent, DatosenrutamientoState> {
  /*
  final PostRepository _repository;

  DatosenrutamientoBloc(this._repository) : super(DatosenrutamientoInitial()) {
    on<FetchPosts>(_onFetchPosts);
  }
*/
  //final _repository = PostRepository(apiUrl: "https://dummyjson.com/posts");
  var _repository = PostRepository(apiUrl: '');
  Timer? timer;
  final String sUrl;
  DatosenrutamientoBloc(this.sUrl) : super(DatosenrutamientoInitial()) {
    // Initialize the repository with the global API URL

    _repository = PostRepository(apiUrl: sUrl);

    on<IniciarTemporizador>((event, emit) {
      timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        add(FetchPosts());
      });
    });
    on<FetchPosts>(_onFetchPosts);
    on<GrabarDatosEnrutar>(_onGrabarDatosEnrutar);
    on<GrabarDatosNormal>(_onGrabarDatosNormal);
  }

  Future<void> _onFetchPosts(
    FetchPosts event,
    Emitter<DatosenrutamientoState> emit,
  ) async {
    try {
      emit(DatosenrutamientoLoading());
      List<Post> data = await _repository.fetchPosts();
      emit(DatosenrutamientoLoaded(posts: data));
    } catch (e) {
      emit(DatosenrutamientoError(message: e.toString()));
    }
  }

  @override
  Future<void> close() {
    // Cancel any ongoing timers or streams if necessary
    timer?.cancel();
    return super.close();
  }

  FutureOr<void> _onGrabarDatosEnrutar(
    GrabarDatosEnrutar event,
    Emitter<DatosenrutamientoState> emit,
  ) {
    // Handle the GrabarDatosEnrutar event
    final String ping = event.ping;
    print(ping);
    //emit(DatosenrutamientoInitial()); // Emit an initial state or any other relevant state
  }

  FutureOr<void> _onGrabarDatosNormal(
    GrabarDatosNormal event,
    Emitter<DatosenrutamientoState> emit,
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
}
