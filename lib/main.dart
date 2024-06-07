import 'package:flutter/material.dart';

import 'Home.dart';

void main()
{
  runApp(Translate());

}

class Translate extends StatelessWidget {
  const Translate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
