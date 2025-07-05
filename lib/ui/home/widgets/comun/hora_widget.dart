import 'package:enruta_auto_app/ui/home/cubit/hora_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HoraWidget extends StatelessWidget {
  const HoraWidget(double d, {super.key, required this.sizeFont});
  final double sizeFont;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HoraCubit, HoraState>(
      builder: (context, state) {
        return Text(state.hora, style: TextStyle(fontSize: sizeFont));
      },
    );
  }
}
