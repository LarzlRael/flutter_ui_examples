import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlidesShow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  //? parametros para poder controllar el tamaño
  final double butlletPrimario;
  final double butlletSecundario;

  const SlidesShow(
      {@required this.slides,
      this.puntosArriba = false,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey,
      this.butlletPrimario = 12.0,
      this.butlletSecundario = 12.0});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new _SlideshowModel(),
        child: SafeArea(
          child: Center(
            child: Builder(
              builder: (BuildContext context) {
                Provider.of<_SlideshowModel>(context).colorPrimario =
                    this.colorPrimario;
                Provider.of<_SlideshowModel>(context).colorSecundario =
                    this.colorSecundario;
                // para los bullets
                Provider.of<_SlideshowModel>(context).bulletPrimario =
                    this.butlletPrimario;
                Provider.of<_SlideshowModel>(context).bulletSecundario =
                    this.butlletSecundario;

                return _CrearEsctructuraSlideShow(
                    puntosArriba: puntosArriba, slides: slides);
              },
            ),
          ),
        ));
  }
}

class _CrearEsctructuraSlideShow extends StatelessWidget {
  const _CrearEsctructuraSlideShow({
    Key key,
    @required this.puntosArriba,
    @required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // * probando para ver si estaba abajo o arriba
        if (this.puntosArriba)
          _Dots(this.slides.length),
        Expanded(child: _Slides(this.slides)),
        if (!this.puntosArriba)
          _Dots(this.slides.length)
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        // para poder hacer una lista de dots segun lo enviado
        children: List.generate(this.totalSlides, (i) => _Dot(i)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlideshowModel>(context);

    double tamano;
    Color color;

    if (ssModel.currentPage >= index - 0.5 &&
        ssModel.currentPage < index + 0.5) {
      tamano = ssModel.bulletPrimario;
      color = ssModel.colorPrimario;
    } else {
      tamano = ssModel.bulletSecundario;
      color = ssModel.colorSecundario;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),

      width: tamano,
      height: tamano,

      margin: EdgeInsets.symmetric(horizontal: 5),
      // verificando el estado del nunmero para colorear
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageviewController = new PageController();

  @override
  void initState() {
    super.initState();

    pageviewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageviewController.page;
    });
  }

  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageviewController,
        children:
            //? estmos recibineod los widgets y lo que vamos a mdandar
            widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

// * metodo que controla el flujo por meido del provider
class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorprimario = Colors.blue;
  Color _colorSecundario = Colors.grey;

  double _bulletPrimario = 12;
  double _bulletSecundario = 12;

  double get currentPage => this._currentPage;

  //? controlar el metodo para poder controlar el tamaño

  //?CurretPage
  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    print(currentPage);
    notifyListeners();
  }

  //? Color Primario
  Color get colorPrimario => this._colorprimario;
  set colorPrimario(Color color) {
    this._colorprimario = color;
  }

  //? Color Secundario
  Color get colorSecundario => this._colorSecundario;
  set colorSecundario(Color color) {
    this._colorSecundario = color;
  }

  //? bullet primario
  double get bulletPrimario => this._bulletPrimario;
  set bulletPrimario(double bulletPrimario) {
    this._bulletPrimario = bulletPrimario;
  }

  //? bullet secundario
  double get bulletSecundario => this._bulletSecundario;
  set bulletSecundario(double bulletSecundario) {
    this._bulletSecundario = bulletSecundario;
  }
}
