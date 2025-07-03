part of 'data_store_bloc.dart';

abstract class DataStoreEvent {}

class AppStarted extends DataStoreEvent {}

class LoggedIn extends DataStoreEvent {
  final String token;

  LoggedIn(this.token);
}

class LoggedOut extends DataStoreEvent {}
