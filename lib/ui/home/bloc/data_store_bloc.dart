import 'dart:async';

import 'package:enruta_auto_app/ui/data/services/flutter_secure_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'data_store_event.dart';
part 'data_store_state.dart';

class DataStoreBloc extends Bloc<DataStoreEvent, DataStoreState> {
  final SecureStorageService _storageService = SecureStorageService();

  DataStoreBloc() : super(AuthInitial()) {
    on<AppStarted>(_onAppStarted);
    on<GrabarIn>(_onGrabarIn);
    on<DeleteOut>(_onDeleteOut);
  }

  Future<void> _onAppStarted(
    AppStarted event,
    Emitter<DataStoreState> emit,
  ) async {
    final valorIp = await _storageService.getToken('IP');
    final valorPort = await _storageService.getToken('PORT');

    if (valorIp != null) {
      emit(AuthStatusValid(valorIp, valorPort!));
    } else {
      emit(AuthStatusInValid());
    }
  }

  Future<void> _onGrabarIn(GrabarIn event, Emitter<DataStoreState> emit) async {
    await _storageService.saveToken('IP', event.valorip);
    await _storageService.saveToken('PORT', event.valorport);
    emit(AuthStatusValid(event.valorip, event.valorport));
  }

  Future<void> _onDeleteOut(
    DeleteOut event,
    Emitter<DataStoreState> emit,
  ) async {
    await _storageService.deleteToken(event.clave);
    emit(AuthStatusInValid());
  }
}
