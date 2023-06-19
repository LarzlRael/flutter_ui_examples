import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/models/zapato_model.dart';
import 'package:shoes_app/src/widgets/widgets.dart';

class ZapatoDescPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              //? aplicando el hero animation
              Hero(tag: 'zapato-1', child: ZapatoSizePreview(fullScreen: true)),
              Positioned(
                top: 80,
                child: FloatingActionButton(
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 50,
                  ),
                  onPressed: () {
                    cambiarStatusLight();
                    Navigator.pop(context);
                  },
                  elevation: 0,
                  highlightElevation: 0,
                  backgroundColor: Colors.transparent,
                ),
              )
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  ZapatoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _BuyNow(),
                  _ColoresYMas(),
                  _BotonesLikeCartSettings()
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class _BotonesLikeCartSettings extends StatefulWidget {
  @override
  State<_BotonesLikeCartSettings> createState() =>
      _BotonesLikeCartSettingsState();
}

class _BotonesLikeCartSettingsState extends State<_BotonesLikeCartSettings> {
  int selected = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BotonSombreado(
            IconButton(
              icon: Icon(Icons.star,
                  color: (selected == 1)
                      ? Colors.red
                      : Colors.grey.withOpacity(0.4),
                  size: 25),
              onPressed: () {
                setState(() {
                  selected = 1;
                });
              },
            ),
          ),
          _BotonSombreado(
            IconButton(
              icon: Icon(
                Icons.add_shopping_cart,
                size: 25,
              ),
              color:
                  (selected == 2) ? Colors.red : Colors.grey.withOpacity(0.4),
              onPressed: () {
                setState(() {
                  selected = 2;
                });
              },
            ),
          ),
          _BotonSombreado(
            IconButton(
              onPressed: () {
                setState(() {
                  selected = 3;
                });
              },
              icon: Icon(
                Icons.settings,
                color:
                    (selected == 3) ? Colors.red : Colors.grey.withOpacity(0.4),
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final IconButton icon;
  const _BotonSombreado(
    this.icon,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.icon,
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: -5,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
    );
  }
}

class BotonColorD {
  final Color color;
  final int index;
  final String urlImagen;
  BotonColorD(this.color, this.index, this.urlImagen);
}

class _ColoresYMas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<BotonColorD> botonesColor = [
      BotonColorD(
        Color(0xffc6d642),
        4,
        'assets/img/verde.png',
      ),
      BotonColorD(
        Color(0xffffad29),
        3,
        'assets/img/amarillo.png',
      ),
      BotonColorD(
        Color(0xff2099f1),
        2,
        'assets/img/azul.png',
      ),
      BotonColorD(
        Color(0xff364d56),
        1,
        'assets/img/negro.png',
      ),
    ];
    return Row(
      children: [
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: botonesColor.length,
            itemBuilder: (_, int index) => Align(
              widthFactor: 0.6,
              child: _BotonColor(
                botonesColor[index],
              ),
            ),
          ),
        ),
        Spacer(),
        BotonNaranja(
          text: 'More related items',
          height: 35,
          width: 170,
          color: Color(0xffffc675),
        ),
      ],
    );
  }
}

class _BotonColor extends StatelessWidget {
  final BotonColorD botonColorD;

  const _BotonColor(this.botonColorD);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(
      context,
      listen: false,
    );
    return FadeInLeft(
      delay: Duration(milliseconds: this.botonColorD.index * 100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          zapatoModel.assetImage = this.botonColorD.urlImagen;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: this.botonColorD.color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _BuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Text(
            '\$180.0',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Bounce(
            delay: Duration(milliseconds: 500),
            infinite: true,
            from: 8,
            child: BotonNaranja(
              text: 'Buy Now',
              width: 120,
              height: 40,
            ),
          ),
        ],
      ),
    );
  }
}
