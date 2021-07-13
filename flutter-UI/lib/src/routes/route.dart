import 'package:containers_custom/src/challenges/cuadrado_animado_page.dart';
import 'package:containers_custom/src/pages/Headers_page.dart';
import 'package:containers_custom/src/pages/emergency.dart';
import 'package:containers_custom/src/pages/graficas_circulares_pages.dart';
import 'package:containers_custom/src/pages/pinteres_page.dart';
import 'package:containers_custom/src/pages/slideshow_page.dart';
import 'package:containers_custom/src/pages/sliver_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'SlideShow', SlideshowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergencia', EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Encabezados', HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'Cuadro animado', CuadradoAnimadoPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Barra de progreso',
      GraficasCircularPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', SliverPage()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}
