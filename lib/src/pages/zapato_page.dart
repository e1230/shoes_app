import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/widgets.dart';

import '../helpers/helpers.dart';

class ZapatoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cambiarStatusDark(); // cambiar status bar a dark
    return Scaffold(
        body: Column(
      children: [
        CustomAppBar(texto: "FOR YOU UWU"),
        SizedBox(height: 20),
        Expanded(
            child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Hero(
                tag: "zapato_1",
                child: ZapatoSizePreview(
                  fullScreen: false,
                ),
              ),
              ZapatoDescripcion(
                titulo: 'Nike Air Max 720',
                descripcion:
                    "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
              ),
            ],
          ),
        )),
        AgregarCarritoBoton(monto: 180.0),
      ],
    ));
  }
}
