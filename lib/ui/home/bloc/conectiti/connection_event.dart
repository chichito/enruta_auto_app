part of 'connection_bloc.dart';

abstract class ConnectionEvent {}

class CheckConnection extends ConnectionEvent {}

class AppStarted extends ConnectionEvent {}

class GrabarIn extends ConnectionEvent {
  final String valorip;
  final String valorport;

  GrabarIn({required this.valorip, required this.valorport});
}

class DeleteOut extends ConnectionEvent {
  final String clave;

  DeleteOut({required this.clave});
}
