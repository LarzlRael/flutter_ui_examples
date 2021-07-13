import 'package:containers_custom/src/theme/theme_chanching.dart';
import 'package:containers_custom/widgets/Headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
final accentColor = Provider.of<ThemeChanger>(context).currenteTheme.accentColor;
    return Scaffold(
      body: HeaderCircularDobleCurva(color: accentColor)
    );
  }
}
