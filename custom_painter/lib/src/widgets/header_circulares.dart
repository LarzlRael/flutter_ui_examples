import 'package:flutter/material.dart';

class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Waves'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: HeaderCurvoPainter(),
        ),
      ),
    );
  }
}

class HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    // properties
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .fill

    lapiz.strokeWidth = 10;

    // drawing with the path and the pen
    final path = Path();

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.4, size.width, size.height * 0.25);

    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWeave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wave curvo double')),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: HeaderWavePainter(),
        ),
      ),
    );
  }
}

class HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    // properties
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .fill

    lapiz.strokeWidth = 10;

    // drawing with the path and the pen
    final path = Path();

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);

    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWeaveGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: HeaderWaveGradientPainter(),
      ),
    );
  }
}

class HeaderWaveGradientPainter extends CustomPainter {
  final Rect rect = Rect.fromCircle(center: Offset(150.0, 150.0), radius: 180);

  final Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff6d05e8),
        Color(0xffc012ff),
        Color(0xff6d05fa),
      ]);
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint()..shader = gradient.createShader(rect);
    // properties
    lapiz.color = Colors.red;
    lapiz.style = PaintingStyle.fill; // .fill

    lapiz.strokeWidth = 10;

    // drawing with the path and the pen
    final path = Path();

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);

    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
