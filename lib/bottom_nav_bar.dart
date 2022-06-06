import 'package:flutter/material.dart';

import 'modules/check_out/check_out_screen.dart';
class Draaaft extends StatelessWidget {
  const Draaaft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cardItemsBuilder(context, '2',),

    );
  }
}
