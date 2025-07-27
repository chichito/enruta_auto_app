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

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DataCubit>();

    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
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

                const Text(
                  "Ingresae el Ping de Enrutamiento",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  onChanged: (value) {},
                  validator: cubit.onValidatePing,
                ),

                const SizedBox(height: 20),
                const Text(
                  "Autorizacion de Enrutamiento",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),

                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  onChanged: cubit.onPingChanged,
                  validator: cubit.onValidatePing,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Observaciones del Enrutamiento",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  onChanged: (value) {},
                  validator: cubit.onValidatePing,
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<DatosenrutamientoBloc>().add(
                          GrabarDatos(ping: cubit.state.sPing ?? ''),
                        );
                        Navigator.of(context).pop();
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(
                        Colors.green,
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.black),
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
