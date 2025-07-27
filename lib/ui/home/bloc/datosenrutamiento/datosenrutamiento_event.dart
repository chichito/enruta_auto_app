part of 'datosenrutamiento_bloc.dart';

abstract class DatosenrutamientoEvent {}

class FetchPosts extends DatosenrutamientoEvent {}

class GrabarDatos extends DatosenrutamientoEvent {
  final String ping;

  GrabarDatos({required this.ping});
}

class IniciarTemporizador extends DatosenrutamientoEvent {}
