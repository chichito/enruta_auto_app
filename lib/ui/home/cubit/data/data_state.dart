part of 'data_cubit.dart';

class DataState {
  final String? sIp;
  final String? sPort;
  final String? sProtocol;
  final String? sPing;
  final String? sAutorizado;
  final String? sObservaciones;

  DataState({
    this.sIp,
    this.sPort,
    this.sProtocol,
    this.sPing,
    this.sAutorizado,
    this.sObservaciones,
  });

  //metodo copyWith
  DataState copyWith({
    String? sIp,
    String? sPort,
    String? sProtocol,
    String? sPing,
    String? sAutorizado,
    String? sObservaciones,
  }) {
    return DataState(
      sIp: sIp ?? this.sIp,
      sPort: sPort ?? this.sPort,
      sProtocol: sProtocol ?? this.sProtocol,
      sPing: sPing ?? this.sPing,
      sAutorizado: sAutorizado ?? this.sAutorizado,
      sObservaciones: sObservaciones ?? this.sObservaciones,
    );
  }
}
