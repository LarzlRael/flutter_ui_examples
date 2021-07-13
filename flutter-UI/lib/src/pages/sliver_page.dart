import 'package:containers_custom/src/theme/theme_chanching.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _ListaTareas(),
      body: Stack(
        children: <Widget>[
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _BotonNewList(),
          )
        ],
      ),
    );
  }
}

class _BotonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);

    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 100,
      child: RaisedButton(
        onPressed: () {},
        color: (appTheme.darkTheme)
            ? appTheme.currenteTheme.accentColor
            : Color(0xffed6762),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
        child: Text(
          'Create New List',
          style: TextStyle(
              color: appTheme.currenteTheme.scaffoldBackgroundColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 3),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscription', Color(0xffF7ccdd5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08ff66)),
    _ListItem('Family', Color(0xffF2a38a)),
    _ListItem('Subscripcions', Color(0xffF7cdd5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currenteTheme;

    return CustomScrollView(
      slivers: <Widget>[
        // SliverAppBar(
        //   floating: true,
        //   elevation: 0,
        //   backgroundColor: Colors.red,
        //   title: Text('hola mundo prros'),
        // ),
        SliverPersistentHeader(
          //? para cuando el el scroll baja se muestrea el delegate
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
              minheight: 200,
              maxheight: 250,
              child: Container(
                alignment: Alignment.center,
                color: appTheme.scaffoldBackgroundColor,
                child: _Titulo(),
              )),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          ...items,
          SizedBox(
            height: 100,
          )
        ]))
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {@required this.minheight,
      @required this.maxheight,
      @required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxheight;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxheight != oldDelegate.maxheight ||
        minheight != oldDelegate.minheight ||
        child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  const _Titulo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Text(
            'New List',
            style: TextStyle(
              color: (appTheme.darkTheme) ? Colors.grey : Color(0xff532128),
              fontSize: 50,
            ),
          ),
        ),
        Stack(
          children: <Widget>[
            SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                color: (appTheme.darkTheme) ? Colors.grey : Color(0xffF7CCDD5),
              ),
            ),
            Container(
              child: Text(
                'List',
                style: TextStyle(
                    color: Color(0xffd93a30),
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _ListaTareas extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscription', Color(0xffF7ccdd5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08ff66)),
    _ListItem('Family', Color(0xffF2a38a)),
    _ListItem('Subscripcions', Color(0xffF7cdd5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => items[index]);
  }
}

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;

  const _ListItem(this.titulo, this.color);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Container(
      child: Text(
        titulo,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      padding: EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      height: 130,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: (appTheme.darkTheme) ? Colors.grey : color,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
