import 'dart:async';

import 'package:enruta_auto_app/ui/data/services/flutter_secure_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'data_store_event.dart';
part 'data_store_state.dart';

class DataStoreBloc extends Bloc<DataStoreEvent, DataStoreState> {
  final SecureStorageService _storageService = SecureStorageService();

  DataStoreBloc() : super(AuthInitial()) {
    on<AppStarted>(_onAppStarted);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
  }

  Future<void> _onAppStarted(
    AppStarted event,
    Emitter<DataStoreState> emit,
  ) async {
    final token = await _storageService.getToken();
    if (token != null) {
      emit(AuthAuthenticated(token));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onLoggedIn(LoggedIn event, Emitter<DataStoreState> emit) async {
    await _storageService.saveToken(event.token);
    emit(AuthAuthenticated(event.token));
  }

  Future<void> _onLoggedOut(
    LoggedOut event,
    Emitter<DataStoreState> emit,
  ) async {
    await _storageService.deleteToken();
    emit(AuthUnauthenticated());
  }
}
