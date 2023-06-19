import 'package:flutter/material.dart';

class BotonNaranja extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final Color color;
  const BotonNaranja({
    @required this.text,
    this.height = 50,
    this.width = 150,
    this.color = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.width,
      height: this.height,
      child: FilledButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () {},
        child: Text(
          text,
        ),
      ),
    );
  }
}
