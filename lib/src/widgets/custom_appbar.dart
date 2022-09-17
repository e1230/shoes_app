import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String texto;

  CustomAppBar({required this.texto});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          margin: EdgeInsets.only(top: 30),
          width: double.infinity,
          //height: 150,
          child: Row(
            children: [
              Text(
                "$texto",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(
                Icons.search,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
