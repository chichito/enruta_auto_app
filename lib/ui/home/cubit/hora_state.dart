part of 'hora_cubit.dart';

class HoraState {
  final String hora;

  HoraState({required this.hora});
  HoraState copyWith({required String hora}) {
    return HoraState(hora: hora);
  }
}

class HoraInitial extends HoraState {
  HoraInitial({required super.hora});
}
