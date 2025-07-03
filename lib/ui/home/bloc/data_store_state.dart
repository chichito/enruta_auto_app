part of 'data_store_bloc.dart';

abstract class DataStoreState {}

class AuthInitial extends DataStoreState {}

class AuthAuthenticated extends DataStoreState {
  final String token;

  AuthAuthenticated(this.token);
}

class AuthUnauthenticated extends DataStoreState {}
