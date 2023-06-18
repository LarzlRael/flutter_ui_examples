import 'package:containers_custom/src/theme/theme_chanching.dart';
import 'package:containers_custom/widgets/pinteres_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            PintenterGrid(),
            _PinterestMenuLocation(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthPantalla = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    final appTheme = Provider.of<ThemeChanger>(context).currenteTheme;

    if (widthPantalla > 500) {
      widthPantalla = widthPantalla - 300;
    }
    return Positioned(
      bottom: 30,
      child: Container(
          width: widthPantalla,
          child: Row(
            children: <Widget>[
              Spacer(),
              PinterestMenu(
                backgroundColor: appTheme.scaffoldBackgroundColor,
                mostrar: mostrar,
                activeColor: appTheme.accentColor,
                //inactiveColor: Colors.blue,
                items: [
                  PinterestButton(
                      icon: Icons.pie_chart,
                      onPressed: () {
                        print('Icon pie_chart');
                      }),
                  PinterestButton(
                      icon: Icons.search,
                      onPressed: () {
                        print('Icon Search');
                      }),
                  PinterestButton(
                      icon: Icons.notifications,
                      onPressed: () {
                        print('Icon notificacion');
                      }),
                  PinterestButton(
                      icon: Icons.supervised_user_circle,
                      onPressed: () {
                        print('Icon Supervide user circle');
                      }),
                ],
              ),
              Spacer(),
            ],
          )),
    );
  }
}

class PintenterGrid extends StatefulWidget {
  @override
  _PintenterGridState createState() => _PintenterGridState();
}

class _PintenterGridState extends State<PintenterGrid> {
  final List<int> items = List.generate(200, (i) => i);

  ScrollController controller = new ScrollController();

  double scrollanterior = 0;
  @override
  void initState() {
    controller.addListener(() {
      // ? ver el estado del offset
      // ? print('ScrollListener ${controller.offset}');
      if (controller.offset > scrollanterior && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }
      scrollanterior = controller.offset;
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
    int count;
    if (MediaQuery.of(context).size.width > 500) {
      count = 3;
    } else {
      count = 2;
    }
    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: count,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinteresItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(1, index.isEven ? 1 : 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinteresItem extends StatelessWidget {
  final int index;
  const _PinteresItem(
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => this._mostrar;
  set mostrar(bool valor) {
    this._mostrar = valor;
    notifyListeners();
  }
}
