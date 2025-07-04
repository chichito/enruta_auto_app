part of 'data_cubit.dart';

class DataState {
  final String? sIp;
  final String? sPort;

  DataState({this.sIp, this.sPort});

  //metodo copyWith
  DataState copyWith({String? sIp, String? sPort}) {
    return DataState(sIp: sIp ?? this.sIp, sPort: sPort ?? this.sPort);
  }
}
