import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'hora_state.dart';

class HoraCubit extends Cubit<HoraState> {
  Timer? _timer;
  HoraCubit()
    : super(
        HoraInitial(hora: DateFormat.yMd().add_jms().format(DateTime.now())),
      ) {
    _iniciarTemporizador();
  }

  void _iniciarTemporizador() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      String hh = DateFormat.yMd().add_jms().format(DateTime.now());
      emit(state.copyWith(hora: hh));
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

/*
class HoraCubit extends Cubit<String> {
  Timer? _timer;
  HoraCubit() : super(DateFormat('HH:mm:ss').format(DateTime.now())) {
    _iniciarTemporizador();
  }

  void _iniciarTemporizador() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      emit(DateFormat('HH:mm:ss').format(DateTime.now()));
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
*/
