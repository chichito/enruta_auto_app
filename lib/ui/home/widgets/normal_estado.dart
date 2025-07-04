import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NormalEstado extends StatelessWidget {
  const NormalEstado({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            height: 300,
            // Width of the container
            width: double.infinity,
            color: Colors.green,
            child: Center(
              child: const Text(
                "Hello! I am inside a container!",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          Gap(30),
          FilledButton.tonalIcon(
            icon: Icon(Icons.energy_savings_leaf_rounded),
            style: ButtonStyle(
              //backgroundColor: WidgetStatePropertyAll(Colors.green),
              textStyle: WidgetStateProperty.resolveWith((value) {
                if (value.contains(WidgetState.pressed)) {
                  return TextStyle(
                    fontSize: 30,
                    //backgroundColor: Colors.blue,
                    decorationColor: Colors.amber,
                    fontWeight: FontWeight.w900,
                    //decoration: BoxDecoration(color: Colors.amber),
                  );
                }
                return TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.amber,
                  fontWeight: FontWeight.w900,
                );
              }),
              //foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              //padding: MaterialStateProperty.all<EdgeInsets>(
              //EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //),
            ),
            onPressed: () {},
            label: Text("Proceder A Enrutarr"),
            // child: Text("Proceder A Enrutar"),
          ),
        ],
      ),
    );
  }
}
