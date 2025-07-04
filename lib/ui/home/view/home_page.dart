import 'package:enruta_auto_app/ui/home/widgets/hora_widget.dart';
import 'package:enruta_auto_app/ui/home/widgets/info_status.dart';
import 'package:enruta_auto_app/ui/home/widgets/normal_estado.dart';
import 'package:flutter/material.dart';
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
                    NormalEstado(),

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
