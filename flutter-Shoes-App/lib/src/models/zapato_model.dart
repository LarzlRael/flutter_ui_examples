import 'package:flutter/material.dart';

class ZapatoModel with ChangeNotifier {
  String _assetsImage = 'assets/img/azul.png';
  double _talla = 9.0;

  String get assetImage => this._assetsImage;
  set assetImage(String valor) {
    this._assetsImage = valor;
    notifyListeners();
  }

  double get talla => this._talla;
  set talla(double valor) {
    this._talla = valor;
    notifyListeners();
  }


}
