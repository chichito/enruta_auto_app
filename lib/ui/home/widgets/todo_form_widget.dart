import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  const TodoFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      //appBar: AppBar(title: const Text('Todo Form')),
      child: SingleChildScrollView(
        child: const Center(child: Text('Todo Form')),
      ),
    );
  }
}
