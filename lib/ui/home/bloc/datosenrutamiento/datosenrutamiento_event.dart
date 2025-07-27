part of 'datosenrutamiento_bloc.dart';

abstract class DatosenrutamientoEvent {}

class FetchPosts extends DatosenrutamientoEvent {}

class GrabarDatosEnrutar extends DatosenrutamientoEvent {
  final String ping;

  GrabarDatosEnrutar({required this.ping});
}

class GrabarDatosNormal extends DatosenrutamientoEvent {
  final String ping;
  final String sAutorizacion;
  final String sObservaciones;

  GrabarDatosNormal({
    required this.ping,
    required this.sAutorizacion,
    required this.sObservaciones,
  });
}

class IniciarTemporizador extends DatosenrutamientoEvent {}
