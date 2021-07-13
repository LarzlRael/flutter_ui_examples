import 'package:flutter/material.dart';

import 'package:containers_custom/src/routes/route.dart';
import 'package:containers_custom/src/theme/theme_chanching.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Diseños en flutter - telefono'),
        ),
        drawer: _MenuPrincipal(),
        body: _ListaOpciones());
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currenteTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: pageRoutes.length,
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(pageRoutes[i].icon, color: appTheme.accentColor),
        title: Text(pageRoutes[i].titulo),
        trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
        onTap: () {
          //? para navegar a una seccion pasada
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => pageRoutes[i].page));
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currenteTheme.accentColor;

    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: accentColor,
                  child: Text(
                    'RG',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
            Expanded(child: _ListaOpciones()),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.lightbulb_outline, color: accentColor),
              title: Text('dark Mode'),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: accentColor,
                onChanged: (value) {
                  appTheme.darkTheme = value;
                },
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.add_to_home_screen, color: accentColor),
              title: Text('Custom Theme'),
              trailing: Switch.adaptive(
                value: appTheme.customtheme,
                activeColor: accentColor,
                onChanged: (value) {
                  appTheme.customtheme = value;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
