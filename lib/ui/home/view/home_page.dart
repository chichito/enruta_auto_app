import 'package:enruta_auto_app/ui/home/bloc/datosenrutamiento/datosenrutamiento_bloc.dart';
import 'package:enruta_auto_app/ui/home/cubit/data/data_cubit.dart';
import 'package:enruta_auto_app/ui/home/widgets/comun/info_status.dart';
import 'package:enruta_auto_app/ui/home/widgets/enrutado_estado.dart';
import 'package:enruta_auto_app/ui/home/widgets/normal_estado.dart';
import 'package:enruta_auto_app/ui/home/widgets/validacion/validar_normal_widget.dart';
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
    final authState = context.watch<DatosEnrutamientoBloc>().state;
    final user =
        authState is DatosEnrutamientoLoading ||
            authState is DatosEnrutamientoLoaded
        ? 1
        : 0;
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
                child: SingleChildScrollView(
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
                          decorationColor: theme.colorScheme.primary.withValues(
                            alpha: 0.3,
                          ),
                        ),
                      ),
                      Gap(50),
                      SizedBox(
                        height: 400,
                        width: double.infinity,
                        child:
                            BlocConsumer<
                              DatosEnrutamientoBloc,
                              DatosEnrutamientoState
                            >(
                              builder: (context, state) {
                                /*if (state is DatosEnrutamientoLoading) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else*/
                                if (state is DatosEnrutamientoLoaded) {
                                  if (state.data == '1')
                                    return NormalEstado();
                                  else if (state.data == '2')
                                    return EnrutadoEstado();
                                  else
                                    return Container(
                                      child: Text(
                                        state.data,
                                        style: textTheme.headlineMedium,
                                      ),
                                    );
                                } else if (state is DatosEnrutamientoError) {
                                  return Center(
                                    child: Text('Error: ${state.message}'),
                                  );
                                }
                                return Container();
                              },
                              listener: (context, state) {
                                if (state is DatosEnrutamientoError) {
                                  /*ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Error: ${state.message}'),
                                    ),
                                  );*/
                                }
                              },
                            ),
                      ),
                      Gap(50),
                      user == 1
                          ? FilledButton.tonalIcon(
                              icon: Icon(Icons.energy_savings_leaf_rounded),
                              style: ButtonStyle(
                                //backgroundColor: WidgetStatePropertyAll(Colors.green),
                                textStyle: WidgetStateProperty.resolveWith((
                                  value,
                                ) {
                                  if (value.contains(WidgetState.pressed)) {
                                    return TextStyle(
                                      fontSize: 30,
                                      decorationColor: Colors.amber,
                                      fontWeight: FontWeight.w900,
                                    );
                                  }
                                  return TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.amber,
                                    fontWeight: FontWeight.w900,
                                  );
                                }),
                              ),
                              onPressed: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext dialogContext) {
                                    return MultiBlocProvider(
                                      providers: [
                                        BlocProvider.value(
                                          value: context.read<DataCubit>(),
                                        ),
                                        BlocProvider.value(
                                          value: context
                                              .read<DatosEnrutamientoBloc>(),
                                        ),
                                      ],
                                      child: ValidarNormalWidget(),
                                      //child: ValidarEnrutarWidget(),
                                    );
                                  },
                                );
                              },
                              label: Text("Proceder A Enrutar"),
                              // child: Text("Proceder A Enrutar"),
                            )
                          : Container(),
                      Gap(10),
                      FilledButton(
                        onPressed: () {
                          context.read<DatosEnrutamientoBloc>().add(
                            GetEstado(),
                          );
                        },
                        child: Text("Refrescar"),
                      ),
                      //HoraWidget(sizeFont: 40, 0),
                    ],
                  ),
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
