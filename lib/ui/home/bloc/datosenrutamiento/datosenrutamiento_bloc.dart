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
  final _repository = PostRepository();

  DatosenrutamientoBloc() : super(DatosenrutamientoInitial()) {
    on<FetchPosts>(_onFetchPosts);
  }
  Future<void> _onFetchPosts(
    FetchPosts event,
    Emitter<DatosenrutamientoState> emit,
  ) async {
    try {
      emit(DatosenrutamientoLoading());
      List<Post> data = await _repository.fetchPosts();
      emit(DatosenrutamientoLoaded(posts: data));
      // emit(HomeScreenError(message: "Something Went Wrong..."));
    } catch (e) {
      print(e);
      emit(DatosenrutamientoError(message: e.toString()));
    }
  }
}
