import 'package:flutter_bloc/flutter_bloc.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataState());

  void onIPChanged(String? sIp) {
    emit(state.copyWith(sIp: sIp));
  }

  void onPortChanged(String? sPort) {
    emit(state.copyWith(sPort: sPort));
  }

  Future<void> onGuardar() async {
    if (state.sIp == null) {
      emit(state.copyWith(error: 'Ip no puede ser en Blanco'));
      return;
    }
    if (state.sPort == null) {
      emit(state.copyWith(error: 'Puerto no puede ser en Blanco'));
      return;
    }

    try {
      // await _authRepository.signIn(state.email!, state.password!);
      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), status: Status.failure));
    }
  }
}
