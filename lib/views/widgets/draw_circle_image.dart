// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class DrawCircleImage extends StatelessWidget {
  const DrawCircleImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundImage: AssetImage('assets/main.png'),
      radius: 75,
    );
  }
}
