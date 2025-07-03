part of 'data_store_bloc.dart';

abstract class DataStoreEvent {}

class AppStarted extends DataStoreEvent {}

class GrabarIn extends DataStoreEvent {
  final String token;

  GrabarIn({required this.token});
}

class LoggedOut extends DataStoreEvent {}
