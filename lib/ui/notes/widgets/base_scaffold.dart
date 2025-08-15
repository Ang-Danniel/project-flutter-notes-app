import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final List<Widget> columnChildren;
  const BaseScreen({super.key, required this.columnChildren});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [const SizedBox(height: 40), ...columnChildren],
        ),
      ),
    );
  }
}
