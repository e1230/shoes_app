import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/zapato_model.dart';
import 'package:shoes_app/src/pages/zapato_desc_page.dart';

class ZapatoSizePreview extends StatelessWidget {
  final bool fullScreen;
  ZapatoSizePreview({
    required this.fullScreen,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ZapatoDescPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (fullScreen) ? 5 : 30,
          vertical: (fullScreen) ? 5 : 0,
        ),
        child: Container(
          width: double.infinity,
          height: (this.fullScreen) ? 420 : 430,
          decoration: BoxDecoration(
            color: Color(0xffFFCF53),
            borderRadius: (!fullScreen)
                ? BorderRadius.circular(50)
                : BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
          ),
          child: Column(
            children: [
              _ZapatoConSombra(),
              if (!fullScreen) _ZapatoTallas(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            right: 0,
            child: _Sombra(),
          ),
          Image(image: AssetImage(zapatoModel.assetImage)),
        ],
      ),
    );
  }
}

class _Sombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 125,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(100), boxShadow: [
          BoxShadow(color: Color(0xffEAA14E), blurRadius: 40),
        ]),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _TallaZapatoCaja(
            numero: 7,
          ),
          _TallaZapatoCaja(
            numero: 7.5,
          ),
          _TallaZapatoCaja(
            numero: 8,
          ),
          _TallaZapatoCaja(
            numero: 8.5,
          ),
          _TallaZapatoCaja(
            numero: 9,
          ),
          _TallaZapatoCaja(
            numero: 9.5,
          ),
        ],
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {
  final double numero;
  const _TallaZapatoCaja({
    required this.numero,
  });
  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return GestureDetector(
      onTap: () {
        final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
        zapatoModel.talla = this.numero;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          "${numero.toString().replaceAll(".0", "")}",
          style: TextStyle(
              color: (numero == zapatoModel.talla)
                  ? Colors.white
                  : Color(0xffF1A23A),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: (numero == zapatoModel.talla)
                ? Color.fromARGB(255, 255, 157, 30)
                : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              if (numero == zapatoModel.talla)
                BoxShadow(
                    color: Color(0xffEAA14E),
                    blurRadius: 10,
                    offset: Offset(0, 5)),
            ]),
      ),
    );
  }
}
