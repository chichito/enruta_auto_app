import 'dart:async';
import 'package:enruta_auto_app/ui/data/services/flutter_secure_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'connection_event.dart';
part 'connection_state.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  final InternetConnectionChecker _customChecker;
  final SecureStorageService _storageService = SecureStorageService();

  ConnectionBloc(this._customChecker) : super(InitialConnectionState()) {
    on<CheckConnection>(_onCheckConnection);
    on<AppStarted>(_onAppStarted);
    on<GrabarIn>(_onGrabarIn);
    on<DeleteOut>(_onDeleteOut);
  }

  FutureOr<void> _onCheckConnection(event, emit) async {
    bool isConnected = await _customChecker.hasConnection;
    if (isConnected) {
      emit(ConnectedState());
    } else {
      emit(DisconnectedState());
    }
  }

  Future<void> _onAppStarted(
    AppStarted event,
    Emitter<ConnectionState> emit,
  ) async {
    final valorIp = await _storageService.getToken('IP');
    final valorPort = await _storageService.getToken('PORT');

    if (valorIp != null) {
      emit(ValidUrlStatus(valorIp, valorPort!));
    } else {
      emit(InValidUrlStatus());
    }
  }

  Future<void> _onGrabarIn(
    GrabarIn event,
    Emitter<ConnectionState> emit,
  ) async {
    await _storageService.saveToken('IP', event.valorip);
    await _storageService.saveToken('PORT', event.valorport);
    emit(ValidUrlStatus(event.valorip, event.valorport));
  }

  Future<void> _onDeleteOut(
    DeleteOut event,
    Emitter<ConnectionState> emit,
  ) async {
    await _storageService.deleteToken(event.clave);
    emit(InValidUrlStatus());
  }

  /*
  @override
  Stream<ConnectionState> mapEventToState(ConnectionEvent event) async* {
    if (event is CheckConnection) {
      bool isConnected = await _customChecker.hasConnection;
      if (isConnected) {
        yield ConnectedState();
      } else {
        yield DisconnectedState();
      }
    } else if (event is AppStarted) {
      add(CheckConnection());
    } else if (event is GrabarIn) {
      yield ValidUrlStatus(event.valorip, event.valorport);
    } else if (event is DeleteOut) {
      yield InValidUrlStatus();
    }
  }
  */
}
