import 'package:enruta_auto_app/ui/home/bloc/data_store_bloc.dart';
import 'package:enruta_auto_app/ui/home/cubit/data_cubit.dart';
import 'package:enruta_auto_app/ui/home/widgets/comun/hora_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final cubit = context.read<DataCubit>();

    return Scaffold(
      appBar: AppBar(title: Text('Ingreso Datos')),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Text(
                            'Ingreso de IP y Puerto',
                            style: textTheme.labelLarge?.copyWith(
                              fontSize: 30,
                              decoration: TextDecoration.underline,
                              decorationThickness: 20,
                              decorationColor: theme.colorScheme.primary
                                  .withOpacity(0.3),
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              label: Text('Ingrese la Ip del Servidor'),
                            ),
                            onChanged: cubit.onIPChanged,
                            validator: cubit.onValidateIP,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              label: Text('Ingrese la Puerto del Servidor'),
                            ),
                            onChanged: cubit.onPortChanged,
                            validator: cubit.onValidatePort,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ],
                      ),
                    ),
                  ),
                  HoraWidget(sizeFont: 20, 0),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ).copyWith(bottom: 20 + keyboardHeight),
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState == null ||
                  !_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Completar no valida la Informacion'),
                  ),
                );
                return;
              }
              _formKey.currentState?.save();
              context.read<DataStoreBloc>().add(
                GrabarIn(
                  valorip: cubit.state.sIp!,
                  valorport: cubit.state.sPort!,
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Se Grabo Exitosamente los Valores'),
                ),
              );
            },
            child: Text('Guardar Datos'),
          ),
        ),
      ),
    );
  }
}
