import 'package:flutter/material.dart';

class BackAppBarWidget extends StatelessWidget {
  final double? width;
  final double? height;
  const BackAppBarWidget({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(right: 20, bottom: 5),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromARGB(255, 59, 59, 59),
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }
}
