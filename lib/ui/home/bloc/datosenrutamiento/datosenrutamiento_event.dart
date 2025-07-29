part of 'datosenrutamiento_bloc.dart';

abstract class DatosEnrutamientoEvent {}

class FetchPosts extends DatosEnrutamientoEvent {}

class GetEstado extends DatosEnrutamientoEvent {}

class GrabarDatosEnrutar extends DatosEnrutamientoEvent {
  final String ping;

  GrabarDatosEnrutar({required this.ping});
}

class GrabarDatosNormal extends DatosEnrutamientoEvent {
  final String ping;
  final String sAutorizacion;
  final String sObservaciones;

  GrabarDatosNormal({
    required this.ping,
    required this.sAutorizacion,
    required this.sObservaciones,
  });
}

class IniciarTemporizador extends DatosEnrutamientoEvent {}
