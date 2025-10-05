import 'package:flutter/material.dart';

class FunctionPage extends StatelessWidget {
  const FunctionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Center(child: Text("COMING SOON", style: textTheme.displayLarge));
  }
}
