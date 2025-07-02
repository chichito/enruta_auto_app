import 'package:enruta_auto_app/ui/home/cubit/hora_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Principal")),
      body: Center(
        child: BlocBuilder<HoraCubit, HoraState>(
          builder: (context, state) {
            return Text(state.hora, style: TextStyle(fontSize: 48));
          },
        ),
      ),
    );
  }
}
