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
}
