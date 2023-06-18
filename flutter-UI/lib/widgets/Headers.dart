import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      //? para poder usar colores hexadecimales
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBordersRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      //? El color tiene que estar dentro del border radiuis
      decoration: BoxDecoration(
          color: Color(0xff615AAB),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          )),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
//      color: Color(0xff615AAB),
      //? El color tiene que estar dentro del border radiuis
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class HeaderMedioTriangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
//      color: Color(0xff615AAB),
      //? El color tiene que estar dentro del border radiuis
      child: CustomPaint(
        painter: _HeaderMedioTriangulo(),
      ),
    );
  }
}

class HeaderTriangularPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
//      color: Color(0xff615AAB),
      //? El color tiene que estar dentro del border radiuis
      child: CustomPaint(
        painter: _HeaderTriangularPico(),
      ),
    );
  }
}

class HeaderCircularCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
//      color: Color(0xff615AAB),
      //? El color tiene que estar dentro del border radiuis
      child: CustomPaint(
        painter: _HeaderCircularCurvo(),
      ),
    );
  }
}

class HeaderCircularDobleCurva extends StatelessWidget {

  final Color color;

  const HeaderCircularDobleCurva({ @required this.color});

  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
//      color: Color(0xff615AAB),
      //? El color tiene que estar dentro del border radiuis
      child: CustomPaint(
        painter: _HeaderCircularCurvoDoble(this.color),
      ),
    );
  }
}

//? ------
class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    //Propiedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .fill
    lapiz.strokeWidth = 5;

    final path = new Path();

    //Dibuar con el path y el lapiz
    path.moveTo(0, size.height * 0.40);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderMedioTriangulo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    //Propiedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .fill
    lapiz.strokeWidth = 5;

    final path = new Path();

    //Dibuar con el path y el lapiz
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderTriangularPico extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    //Propiedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .fill
    lapiz.strokeWidth = 5;

    final path = new Path();

    //Dibuar con el path y el lapiz

    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderCircularCurvo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    //Propiedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .fill
    lapiz.strokeWidth = 5;

    final path = new Path();

    //Dibuar con el path y el lapiz

    path.lineTo(0, size.height * 0.25);
    //? de donde empieza a donde va y donde termina
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.50, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderCircularCurvoDoble extends CustomPainter {

  final Color color;

  _HeaderCircularCurvoDoble(this.color);
  
  
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    //Propiedades
    lapiz.color = this.color;
    lapiz.style = PaintingStyle.fill; // .fill
    lapiz.strokeWidth = 10;

    final path = new Path();

    //Dibuar con el path y el lapiz

    path.lineTo(0, size.height * 0.25);
    //? de donde empieza a donde va y donde termina
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);

    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);

    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
