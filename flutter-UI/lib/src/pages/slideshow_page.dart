import 'package:containers_custom/src/theme/theme_chanching.dart';
import 'package:containers_custom/widgets/Slideshow.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool islarge;
    if (MediaQuery.of(context).size.height > 500) {
      islarge = true;
    } else {
      islarge = false;
    }

    final children = [
      Expanded(child: MiSlideShow()),
      Expanded(child: MiSlideShow()),
    ];
    return Scaffold(
        body: (islarge) ? Column(children: children) : Row(children: children));
  }
}

class MiSlideShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    final accentColor = appTheme.currenteTheme.accentColor;

    return Scaffold(
      body: SlidesShow(
        puntosArriba: false,
        colorPrimario: (appTheme.darkTheme) ? accentColor : Color(0XffFF5a7E),
        butlletPrimario: 12,
        butlletSecundario: 12,
        //colorSecundario: Colors.blue,
        slides: <Widget>[
          SvgPicture.asset('assets/svg/slide-1.svg'),
          SvgPicture.asset('assets/svg/slide-2.svg'),
          SvgPicture.asset('assets/svg/slide-3.svg'),
          SvgPicture.asset('assets/svg/slide-4.svg'),
          SvgPicture.asset('assets/svg/slide-5.svg')
        ],
      ),
    );
  }
}
