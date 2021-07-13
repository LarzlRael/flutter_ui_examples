import 'package:flutter/material.dart';

class AudioPlayerMode with ChangeNotifier {
  bool _playing = false;
  Duration _songDuration  = new Duration(milliseconds: 0);
  Duration _current       = new Duration(milliseconds: 0);


  String get songTotalduration => this.printDuration(this._songDuration);
  String get currentSecond     => this.printDuration(this._current);


  double get porcentaje => (this._songDuration.inSeconds > 0)
      ? this._current.inSeconds / this._songDuration.inSeconds
      : 0;

  AnimationController _controller;

  set controller(AnimationController valor) {
    this._controller = valor;
  }

  AnimationController get controller => this._controller;

  set playing(bool valor) {
    this.playing = valor;
    notifyListeners();
  }

  bool get playing => this._playing;

  Duration get songDuration => this._songDuration;
  Duration get current => this._current;

  set songDuration(Duration valor) {
    this._songDuration = valor;
    notifyListeners();
  }

  set current(Duration valor) {
    this._current = valor;
    notifyListeners();
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitsMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitsSeconds = twoDigits(duration.inSeconds.remainder(60));
    //
    return "$twoDigitsMinutes:$twoDigitsSeconds";
  }
}
