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
              Hero(tag: "zapato_1", child: ZapatoSizePreview(fullScreen: true)),
              Positioned(
                top: 60,
                child: FloatingActionButton(
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 60,
                  ),
                  onPressed: () {
                    cambiarStatusDark();
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
            child: Column(
              children: [
                ZapatoDescripcion(
                  titulo: 'Nike Air Max 720',
                  descripcion:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
                _BuyNow(),
                _Colors(),
                _BotonesLight()
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class _BotonesLight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BotonSombreado(Icon(
            Icons.health_and_safety_rounded,
            color: Colors.red,
            size: 25,
          )),
          _BotonSombreado(Icon(
            Icons.javascript_rounded,
            color: Colors.green,
            size: 25,
          )),
          _BotonSombreado(Icon(
            Icons.flip_camera_ios_sharp,
            color: Colors.orangeAccent,
            size: 25,
          )),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;
  _BotonSombreado(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.icon,
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 10),
              blurRadius: 20,
              spreadRadius: -5),
        ],
      ),
    );
  }
}

class _Colors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
              child: Stack(
            children: [
              Positioned(
                  left: 90,
                  child: _BotonColor(Color.fromARGB(80, 16, 16, 16), 4,
                      "assets/imgs/negro.png")),
              Positioned(
                  left: 60,
                  child: _BotonColor(Color.fromARGB(255, 53, 123, 255), 3,
                      "assets/imgs/azul.png")),
              Positioned(
                  left: 30,
                  child: _BotonColor(Color.fromARGB(255, 255, 136, 24), 2,
                      "assets/imgs/amarillo.png")),
              _BotonColor(
                  Color.fromARGB(254, 13, 243, 16), 1, "assets/imgs/verde.png"),
            ],
          )),
          BotonNaranja(
            texto: "More related items",
            alto: 30,
            ancho: 170,
          )
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String urlImagen;
  _BotonColor(this.color, this.index, this.urlImagen);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.index * 200),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = this.urlImagen;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _BuyNow extends StatelessWidget {
  const _BuyNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            Text(
              "\$180.0",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Bounce(
              delay: Duration(milliseconds: 500),
              from: 8,
              child: BotonNaranja(
                texto: "Buy now",
                alto: 40,
                ancho: 120,
              ),
            )
          ],
        ),
      ),
    );
  }
}
