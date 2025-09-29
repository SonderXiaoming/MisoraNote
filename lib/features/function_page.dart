import 'package:flutter/material.dart';

class FunctionPage extends StatelessWidget {
  const FunctionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final mediaWidth = MediaQuery.of(context).size.width;

    return Text("COMING SOON", style: textTheme.displayLarge);
  }
}
