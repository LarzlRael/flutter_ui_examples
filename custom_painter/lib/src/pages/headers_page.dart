import 'package:custom_painter/src/widgets/header_circulares.dart';
import 'package:flutter/material.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BackGrounds'),
        centerTitle: true,
      ),
      body: HeaderWeaveGradient(),
      drawer: _createDrawer(context),
    );
  }

  Widget _createDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(
              Icons.pages,
            ),
            title: Text('Simple BackGround'),
            onTap: () {
              Navigator.pushNamed(context, 'simple');
            },
          ),
          ListTile(
            leading: Icon(Icons.circle),
            title: Text('Circle Brackground'),
            onTap: () {
              Navigator.pushNamed(context, 'redondeado');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.pedal_bike_sharp,
            ),
            title: Text('Picos background'),
            onTap: () {
              Navigator.pushNamed(context, 'Peak');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.media_bluetooth_off,
            ),
            title: Text('Waves'),
            onTap: () {
              Navigator.pushNamed(context, 'waves');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.radio,
            ),
            title: Text('Waves double'),
            onTap: () {
              Navigator.pushNamed(context, 'wavesdouble');
            },
          ),
        ],
      ),
    );
  }
}
