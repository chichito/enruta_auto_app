import 'package:enruta_auto_app/ui/home/bloc/datosenrutamiento/datosenrutamiento_bloc.dart';
import 'package:enruta_auto_app/ui/home/cubit/data/data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValidarNormalWidget extends StatefulWidget {
  const ValidarNormalWidget({super.key});

  @override
  State<ValidarNormalWidget> createState() => _ValidarNormalWidgetState();
}

class _ValidarNormalWidgetState extends State<ValidarNormalWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DataCubit>();

    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          //color: const Color.fromARGB(255, 7, 99, 4),
          gradient: LinearGradient(
            colors: [
              Colors.white.withValues(alpha: 0.8),
              Colors.green.withValues(alpha: 0.9),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(6, 6),
              spreadRadius: 2,
              blurStyle: BlurStyle.solid,
            ),
          ],
        ),
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            onChanged: () => setState(() {
              isValid = _formKey.currentState!.validate();
            }),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Align(
                  alignment: Alignment.topRight,
                  child: CloseButton(),
                ),
                const Center(
                  child: Text(
                    "PING DE ENRUTAMIENTO",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 16),

                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('El Ping de Enrutamiento'),
                    labelStyle: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w900,
                      color: Colors.black54,
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: cubit.onPingChanged,
                  validator: cubit.onValidatePing,
                ),

                const SizedBox(height: 20),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text('Autorizacion de Enrutamiento'),
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.black54,
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: cubit.onAutorizadoChanged,
                  validator: cubit.onValidateString,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text('Observacion del Enrutamiento'),
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.black54,
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: cubit.onObservacionChanged,
                  validator: cubit.onValidateString,
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: Visibility(
                    visible: isValid,
                    child: ElevatedButton(
                      onPressed: isValid
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                context.read<DatosEnrutamientoBloc>().add(
                                  GrabarDatosNormal(
                                    ping: cubit.state.sPing ?? '',
                                    sAutorizacion:
                                        cubit.state.sAutorizado ?? '',
                                    sObservaciones:
                                        cubit.state.sObservaciones ?? '',
                                  ),
                                );
                                Navigator.of(context).pop();
                              }
                            }
                          : null,
                      style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll(
                          Color.fromARGB(255, 101, 120, 228),
                        ),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
