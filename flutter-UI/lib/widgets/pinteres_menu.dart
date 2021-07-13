import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final IconData icon;
  final Function onPressed;

  PinterestButton({@required this.icon, @required this.onPressed});
}

class PinterestMenu extends StatelessWidget {
  final bool mostrar;

  //? propiedades de personalizacion
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;
  PinterestMenu(
      {this.mostrar = true,
      this.backgroundColor,
      this.activeColor = Colors.red,
      this.inactiveColor = Colors.grey,
      @required this.items
      });

  // final List<PinterestButton> items = [
    
  // ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: (mostrar) ? 1 : 0,
        child: Builder(
          builder: (BuildContext context) {
            Provider.of<_MenuModel>(context).backgroundColor =
                this.backgroundColor;
            Provider.of<_MenuModel>(context).activeColor = this.activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;

            return PinteresMenuBackGround(
              child: _MenuItems(items),
            );
          },
        ),
      ),
    );
  }
}

class PinteresMenuBackGround extends StatelessWidget {
  final Widget child;

  const PinteresMenuBackGround({@required this.child});

  @override
  Widget build(BuildContext context) {
    Color backgroudColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      child: child,
      width: 200,
      height: 60,
      decoration: BoxDecoration(
          color: backgroudColor,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            menuItems.length, (i) => _PinterestMenuBUtton(i, menuItems[i])));
  }
}

class _PinterestMenuBUtton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuBUtton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;
    final menuModel = Provider.of<_MenuModel>(context);

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (itemSeleccionado == index) ? 30 : 25,
          color: (itemSeleccionado == index)
              ? menuModel.activeColor
              : menuModel.inactiveColor,
        ),
      ),
    );
  }
}

//? clase para poder usar el provider

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;
  Color backgroundColor = Colors.white;
  Color activeColor = Colors.black;
  Color inactiveColor = Colors.blueGrey;

  int get itemSeleccionado => this._itemSeleccionado;
  set itemSeleccionado(int index) {
    this._itemSeleccionado = index;
    notifyListeners();
  }
}
