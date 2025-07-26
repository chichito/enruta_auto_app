part of 'data_store_bloc.dart';

class DataStoreState {}

class AuthInitial extends DataStoreState {}

class AuthStatusValid extends DataStoreState {
  final String valorIp;
  final String valorPort;
  final String? valorProtocol;

  String get isUrl => '$valorProtocol$valorIp:$valorPort';

  AuthStatusValid(this.valorProtocol, this.valorIp, this.valorPort);
}

class AuthStatusInValid extends DataStoreState {}
