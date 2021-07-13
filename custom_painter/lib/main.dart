import 'package:custom_painter/src/pages/headers_page.dart';
import 'package:custom_painter/src/widgets/header_circulares.dart';
import 'package:custom_painter/src/widgets/headers.dart';
import 'package:custom_painter/src/widgets/headers_picos.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HeadersPage(),
      initialRoute: 'xd',
      routes: {
        'xd': (BuildContext context) => HeadersPage(),
        'simple': (BuildContext context) => HeaderCuadrado(),
        'redondeado': (BuildContext context) => HeaderBordesRedondeados(),
        'Peak': (BuildContext context) => HeaderPico(),
        'waves': (BuildContext context) => HeaderCurvo(),
        'wavesdouble': (BuildContext context) => HeaderWeave(),
      },
    );
  }
}
