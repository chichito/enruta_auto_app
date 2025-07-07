import 'package:enruta_auto_app/ui/home/bloc/datosenrutamiento/datosenrutamiento_bloc.dart';
import 'package:enruta_auto_app/ui/home/widgets/comun/info_status.dart';
import 'package:enruta_auto_app/ui/home/widgets/pruebas.dart';
import 'package:enruta_auto_app/ui/home/widgets/servicio_invalid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      //appBar: AppBar(title: Text("Principal")),
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              //height: double.infinity,
              child: Image.asset(
                'assets/images/imagenfonto.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
            SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Gap(80),
                    Text(
                      'SISTEMA DE ENRUTAMIENTO',
                      style: textTheme.labelLarge?.copyWith(
                        fontSize: 30,
                        decoration: TextDecoration.underline,
                        decorationThickness: 20,
                        decorationColor: theme.colorScheme.primary.withOpacity(
                          0.3,
                        ),
                      ),
                    ),
                    Gap(50),
                    //ServicioInvalid(),
                    BlocBuilder<DatosenrutamientoBloc, DatosenrutamientoState>(
                      builder: (context, state) {
                        if (state is DatosenrutamientoInitial) {
                          return const Center(child: Text('Please wait...'));
                        } else if (state is DatosenrutamientoLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is DatosenrutamientoLoaded) {
                          return Center(child: Pruebas(post: state.posts));
                        } else if (state is DatosenrutamientoError) {
                          return Center(child: Text('Error: ${state.message}'));
                        } else {
                          return Container();
                        }
                      },
                    ),
                    //HoraWidget(sizeFont: 40, 0),
                  ],
                ),
              ),
            ),
            InfoStatus(),
          ],
        ),
      ),
    );
  }
}
