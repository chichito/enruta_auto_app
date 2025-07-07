import 'package:enruta_auto_app/ui/home/bloc/datos/bloc/datosenrutamiento_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pruebas extends StatelessWidget {
  const Pruebas({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.amber,
                height: 200,
                child: Container(
                  color: Colors.green,
                  height: 50,
                  child:
                      BlocBuilder<
                        DatosenrutamientoBloc,
                        DatosenrutamientoState
                      >(
                        builder: (context, state) {
                          if (state is DatosenrutamientoInitial) {
                            return const Center(child: Text('Please wait...'));
                          } else if (state is DatosenrutamientoLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is DatosenrutamientoLoaded) {
                            return ListView.builder(
                              itemCount: state.posts.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ListTile(
                                    title: Text(state.posts[index].title),
                                    subtitle: Text(state.posts[index].body),
                                  ),
                                );
                              },
                            );
                          } else if (state is DatosenrutamientoError) {
                            return Center(
                              child: Text('Error: ${state.message}'),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
