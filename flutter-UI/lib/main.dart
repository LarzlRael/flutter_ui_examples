//import 'package:containers_custom/src/challenges/cuadrado_animado_page.dart';

//import 'package:containers_custom/src/pages/graficas_circulares_pages.dart';
import 'package:containers_custom/src/models/layout_mode.dart';
import 'package:containers_custom/src/pages/emergency.dart';
import 'package:containers_custom/src/pages/lancher_page.dart';
import 'package:containers_custom/src/pages/launcher_table_page.dart';
import 'package:containers_custom/src/pages/sliver_page.dart';
import 'package:containers_custom/src/theme/theme_chanching.dart';
//import 'package:containers_custom/src/pages/pinteres_page.dart';
//import 'package:containers_custom/src/pages/slideshow_page.dart';
//import 'file:///C:/Users/Larz/Desktop/Projectos/flutter_Proyects/containers_custom/lib/src/labs/slideshow_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => new LayoutModel(),
        child: ChangeNotifierProvider(
            create: (_) => new ThemeChanger(1), child: MyApp()),
      ),
    );

// void main() => runApp(MultiProvider(
//       providers: [
//         Provider<ThemeChanger>(create: (_) => new ThemeChanger(2)),
//         Provider<LayoutModel>(create: (_) => new LayoutModel()),
//       ],
//       child: MyApp(),
//     ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currenteTheme;

    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          // print('orintacion $orientation');
          final screenSize = MediaQuery.of(context).size;
          if (screenSize.width > 500) {
            return LauncherTable();
          } else {
            return LauncherPage();
          }
          // return Container(
          //   child: LauncherPage(),
          // );
        },
      ),
    );
  }
}
