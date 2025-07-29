part of 'datosenrutamiento_bloc.dart';

abstract class DatosEnrutamientoState {}

class DatosEnrutamientoInitial extends DatosEnrutamientoState {}

class DatosEnrutamientoLoading extends DatosEnrutamientoState {}

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
