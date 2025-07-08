import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NormalEstado extends StatelessWidget {
  const NormalEstado({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            height: 400,
            // Width of the container
            width: double.infinity,
            //color: Colors.green,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage("assets/images/degradadogris.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.white.withValues(alpha: 0.8),
                  BlendMode.dstATop,
                ),
              ),
            ),
            child: Center(
              child: Container(
                margin: EdgeInsets.only(
                  top: 100,
                  bottom: 100,
                  left: 30,
                  right: 30,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    //topRight: Radius.elliptical(0, 20),
                    bottomRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                  color: Colors.green,
                  border: Border(
                    left: BorderSide(color: Colors.black, width: 10),
                    bottom: BorderSide(color: Colors.black, width: 10),
                  ),
                ),
                //color: Colors.green,
                child: Center(
                  child: Text(
                    "Se Encuentra En Estado Normal!!!",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      color: Colors.black,
                      decoration: TextDecoration.combine([
                        TextDecoration.underline,
                        //TextDecoration.lineThrough,
                      ]),
                    ),
                  ),
                ),
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
                    decorationColor: Colors.amber,
                    fontWeight: FontWeight.w900,
                  );
                }
                return TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.amber,
                  fontWeight: FontWeight.w900,
                );
              }),
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
