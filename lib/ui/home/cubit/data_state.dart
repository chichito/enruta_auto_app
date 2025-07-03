part of 'data_cubit.dart';

enum Status { initial, loading, success, failure }

class DataState {
  final Status? status;
  final String? sIp;
  final String? sPort;
  final String? error;

  DataState({this.sIp, this.sPort, this.status = Status.initial, this.error});

  //metodo copyWith
  DataState copyWith({
    String? sIp,
    String? sPort,
    Status? status,
    String? error,
  }) {
    return DataState(
      sIp: sIp ?? this.sIp,
      sPort: sPort ?? this.sPort,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
