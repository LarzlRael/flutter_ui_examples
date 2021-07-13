import 'package:containers_custom/src/theme/theme_chanching.dart';
import 'package:containers_custom/widgets/radial_progess.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GraficasCircularPage extends StatefulWidget {
  GraficasCircularPage({Key key}) : super(key: key);

  @override
  _GraficasCircularPageState createState() => _GraficasCircularPageState();
}

class _GraficasCircularPageState extends State<GraficasCircularPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                porcentaje += 10;
                if (porcentaje > 100) {
                  porcentaje = 0;
                }
              });
            }),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CustomRadailProgress(
                    porcentaje: porcentaje, color: Colors.black),
                CustomRadailProgress(
                    porcentaje: porcentaje*1.2, color: Colors.green)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CustomRadailProgress(
                  porcentaje: porcentaje*1.3,
                  color: Colors.blueGrey,
                ),
                CustomRadailProgress(
                    porcentaje: porcentaje *1.5, color: Colors.yellow,)
              ],
            )
          ],
        ));
  }
}

class CustomRadailProgress extends StatelessWidget {
  final double porcentaje;
  final Color color;

  const CustomRadailProgress({@required this.porcentaje, @required this.color});

  @override
  Widget build(BuildContext context) {


    final appTheme =Provider.of<ThemeChanger>(context).currenteTheme;

    return Container(
      width: 150,
      height: 150,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: this.color,
        colorSecundario: appTheme.textTheme.bodyText1.color,
        grosorSecundario: 4,
        grosorPrimario: 10,
      ),
    );
  }
}
