import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(Dicee());

class Dicee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

