part of 'data_store_bloc.dart';

class DataStoreState {}

class AuthInitial extends DataStoreState {}

class AuthStatusValid extends DataStoreState {
  final String valorIp;
  final String valorPort;
  String get isUrl => 'http://$valorIp:$valorPort';

  AuthStatusValid(this.valorIp, this.valorPort);
}

class AuthStatusInValid extends DataStoreState {}
