import 'package:enruta_auto_app/ui/home/bloc/data_store_bloc.dart';
import 'package:enruta_auto_app/ui/home/widgets/comun/hora_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoStatus extends StatelessWidget {
  const InfoStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.read<DataStoreBloc>().state;
    final isUrl = authState is AuthStatusValid ? authState.isUrl : null;
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
          child: Card(
            elevation: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoItem(
                  iconPath: 'assets/icons/ip.png',
                  value: 'Direccion:',
                  label: isUrl.toString(),
                ),
                VerticalDivider(color: Colors.grey[300]),
                HoraWidget(sizeFont: 14, 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  const InfoItem({
    super.key,
    required this.iconPath,
    required this.value,
    required this.label,
  });

  final String iconPath;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Image.asset(iconPath),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(value, style: textTheme.titleMedium),
            Text(label, style: textTheme.bodySmall),
          ],
        ),
      ],
    );
  }
}
