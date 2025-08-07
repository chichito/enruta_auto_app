part of 'datosenrutamiento_bloc.dart';

class DatosEnrutamientoState {
  /*
  DatosEnrutamientoState({required this.valorinitialState});

  final String valorinitialState;
  get initialState => valorinitialState;

  DatosEnrutamientoState copyWith({String? valorinitialState}) {
    return DatosEnrutamientoState(
      // isGpsEnabled: isGpsEnable1 != null ? isGpsEnabled1! : this.isGpsEnabled,
      valorinitialState: valorinitialState ?? this.valorinitialState,
    );
  }  
  */
}

class DatosEnrutamientoInitial extends DatosEnrutamientoState {}

class DatosEnrutamientoLoading extends DatosEnrutamientoState {
  final String valorAnteriorState;

  DatosEnrutamientoLoading({required this.valorAnteriorState});
}

class DatosfetchPostsLoaded extends DatosEnrutamientoState {
  final List<Post> posts;

  DatosfetchPostsLoaded({required this.posts});
}

class DatosEnrutamientoLoaded extends DatosEnrutamientoState {
  final String data;
  DatosEnrutamientoLoaded({required this.data});
}

class DatosEnrutamientoError extends DatosEnrutamientoState {
  final String message;
  DatosEnrutamientoError({required this.message});
}
