part of 'datosenrutamiento_bloc.dart';

abstract class DatosenrutamientoState {}

class DatosenrutamientoInitial extends DatosenrutamientoState {}

class DatosenrutamientoLoading extends DatosenrutamientoState {}

class DatosenrutamientoLoaded extends DatosenrutamientoState {
  final List<Post> posts;

  DatosenrutamientoLoaded({required this.posts});
}

class DatosenrutamientoError extends DatosenrutamientoState {
  final String message;
  DatosenrutamientoError({required this.message});
}
