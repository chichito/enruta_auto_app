part of 'connection_bloc.dart';

abstract class ConnectionState {}

class InitialConnectionState extends ConnectionState {}

class ConnectedState extends ConnectionState {}

class DisconnectedState extends ConnectionState {}

class ValidUrlStatus extends ConnectionState {
  final String valorIp;
  final String valorPort;
  String get isUrl => 'http://$valorIp:$valorPort';

  ValidUrlStatus(this.valorIp, this.valorPort);
}

class InValidUrlStatus extends ConnectionState {}
