import 'package:flutter/material.dart';

class BotonNaranja extends StatelessWidget {
  final String text;
  final double alto;
  final double ancho;
  final Color color;
  const BotonNaranja(
      {@required this.text,
      this.alto = 50,
      this.ancho = 150,
      this.color = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: this.ancho,
      height: this.alto,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: this.color,
      ),
      child: Text(
        '$text',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
