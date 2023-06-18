import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CuadradoAnimado(),
    ));
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    Key key,
  }) : super(key: key);

  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  //? Las animaciones funciones con 2 el animation y el animationController
  AnimationController controller;
  Animation<double> rotacion;
  Animation<double> opacidad;
  Animation<double> moverDerecha;
  Animation<double> agrandar;

  Animation<double> opacidadOut;

  @override
  void initState() {
    // el math.pi es par que complete la vueta correctamente
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    rotacion = Tween(begin: 0.0, end: 2.0 * Math.pi).animate(
        //? esto es para que se vaya hacer otra tipo de animacion
        CurvedAnimation(parent: controller, curve: Curves.elasticOut));

    // para la opcidad del elemento que estamos animando
    rotacion = Tween(begin: 0.0, end: 2.0 * Math.pi)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    opacidad = Tween(begin: 0.0, end: 1.0).animate(controller);

    opacidadOut = Tween(begin: 0.0,end:1.0).
    animate(CurvedAnimation(parent: controller,curve: Interval(0.75, 1,curve: Curves.easeOut)));

    moverDerecha = Tween(begin: 0.0, end: 200.0).animate(controller);
    
    agrandar = Tween(begin: 0.0, end: 2.0).animate(controller);

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reverse();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Play / Reproduccion
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget childRectangulo) {
        //? metodo para poder mover un elemento
        return Transform.translate(
          offset: Offset(moverDerecha.value, 0),
          // ? metodo para poder rotawr el elemento cuadrado
          child: Transform.rotate(
              angle: rotacion.value,
              child: Opacity(
                  opacity: opacidad.value-opacidadOut.value,
                  child: Transform.scale(
                      scale: agrandar.value, child: childRectangulo))),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
