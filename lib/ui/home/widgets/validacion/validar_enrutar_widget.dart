import 'package:enruta_auto_app/ui/home/bloc/datosenrutamiento/datosenrutamiento_bloc.dart';
import 'package:enruta_auto_app/ui/home/cubit/data/data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValidarEnrutarWidget extends StatefulWidget {
  const ValidarEnrutarWidget({super.key});

  @override
  State<ValidarEnrutarWidget> createState() => _ValidarEnrutarWidgetState();
}

class _ValidarEnrutarWidgetState extends State<ValidarEnrutarWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DataCubit>();

    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          //color: Colors.white,
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 228, 10, 10).withValues(alpha: 0.8),
              const Color.fromARGB(255, 104, 61, 5).withValues(alpha: 0.9),
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
        child: Form(
          key: _formKey,
          onChanged: () => setState(() {
            isValid = _formKey.currentState!.validate();
          }),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Align(alignment: Alignment.topRight, child: CloseButton()),
              const Center(
                child: Text(
                  "PING DE ENRUTAMIENTO",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
                ),
              ),
              const SizedBox(height: 16),

              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(134, 238, 238, 238),
                  errorStyle: TextStyle(
                    fontSize: 25,
                    color: const Color.fromARGB(255, 8, 39, 216),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                textInputAction: TextInputAction.next,
                style: const TextStyle(
                  fontSize: 90,
                  fontWeight: FontWeight.w900,
                  color: Colors.black54,
                ),
                onChanged: cubit.onPingChanged,
                validator: cubit.onValidatePing,
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                GrabarDatosEnrutar(ping: cubit.state.sPing!),
                              );
                              Navigator.of(context).pop();
                            }
                          }
                        : null,
                    style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(
                        Color.fromARGB(255, 241, 118, 96),
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
                        fontSize: 80,
                        fontWeight: FontWeight.w900,
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
    );
  }
}
