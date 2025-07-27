import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:string_validator/string_validator.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataState());

  void onIPChanged(String? sIp) {
    emit(state.copyWith(sIp: sIp));
  }

  void onPortChanged(String? sPort) {
    emit(state.copyWith(sPort: sPort));
  }

  void onProtocolChanged(String? sProtocol) {
    emit(state.copyWith(sProtocol: sProtocol));
  }

  void onPingChanged(String? sPing) {
    emit(state.copyWith(sPing: sPing));
  }

  void onAutorizadoChanged(String? sAutorizado) {
    emit(state.copyWith(sAutorizado: sAutorizado));
  }

  void onObservacionChanged(String? sObservaciones) {
    emit(state.copyWith(sObservaciones: sObservaciones));
  }

  String? onValidateIP(String? sIp) {
    if (sIp == null || sIp.isEmpty) {
      return 'Por favor ingresa una IP';
    }
    if (sIp.isIP())
      return null;
    else
      return 'Ip No Valida';
  }

  String? onValidatePort(String? sPort) {
    if (sPort == null || sPort.isEmpty) {
      return 'Por favor ingresa el Puerto';
    }
    if (sPort.isNumeric)
      return null;
    else
      return 'Ingrese Solo Numeros';
  }

  String? onValidatePing(String? sPing) {
    if (sPing == null || sPing.isEmpty) {
      return 'Por favor ingresa el Ping';
    }
    if (sPing.length == 4) {
      if (sPing.isNumeric)
        return null;
      else
        return 'Ingrese Solo Numeros';
    } else {
      return 'El Ping debe tener 4 digitos';
    }
  }

  String? onValidateString(String? sString) {
    if (sString == null || sString.isEmpty) {
      return 'Por favor ingresa un valor';
    }
    if (sString.isNotEmpty) {
      return null;
    } else {
      return 'Ingrese un valor valido';
    }
  }
}
