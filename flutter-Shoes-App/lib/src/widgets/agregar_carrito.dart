import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/widgets.dart';

class AgregarCarritoBoton extends StatelessWidget {
  final double monto;
  const AgregarCarritoBoton({this.monto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.10),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: <Widget>[
            SizedBox(width: 20),
            Text(
              '\$$monto',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            BotonNaranja(
              text: 'Add to Cart',
            ),
            SizedBox(width: 20)
          ],
        ),
      ),
    );
  }
}
