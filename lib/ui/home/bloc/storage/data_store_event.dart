part of 'data_store_bloc.dart';

abstract class DataStoreEvent {}

class AppStarted extends DataStoreEvent {}

class GrabarIn extends DataStoreEvent {
  final String valorip;
  final String valorport;
  final String valorprotocol;

  GrabarIn({
    required this.valorip,
    required this.valorport,
    required this.valorprotocol,
  });
}

class DeleteOut extends DataStoreEvent {
  final String clave;

  DeleteOut({required this.clave});
}
