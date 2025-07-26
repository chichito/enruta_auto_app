part of 'data_cubit.dart';

class DataState {
  final String? sIp;
  final String? sPort;
  final String? sProtocol;

  DataState({this.sIp, this.sPort, this.sProtocol});

  //metodo copyWith
  DataState copyWith({String? sIp, String? sPort, String? sProtocol}) {
    return DataState(
      sIp: sIp ?? this.sIp,
      sPort: sPort ?? this.sPort,
      sProtocol: sProtocol ?? this.sProtocol,
    );
  }
}
