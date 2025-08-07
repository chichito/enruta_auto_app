import 'package:flutter/material.dart';

class ErrorEstado extends StatelessWidget {
  const ErrorEstado({
    super.key,
    required this.mensaje,
    required this.isLoading,
  });
  final String mensaje;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            height: 360,
            // Width of the container
            width: double.infinity,
            //color: Colors.green,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage("assets/images/degradadorojocirculo.jpg"),
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
                  color: const Color.fromARGB(255, 240, 79, 92),
                  border: Border(
                    left: BorderSide(color: Colors.black, width: 10),
                    bottom: BorderSide(color: Colors.black, width: 10),
                  ),
                ),
                //color: Colors.green,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        mensaje,
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
                      if (isLoading)
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
