import 'package:enruta_auto_app/ui/home/widgets/hora_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Principal")),
      body: Center(child: HoraWidget(sizeFont: 40, 0)),
    );
  }
}
