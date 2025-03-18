import 'package:flutter/material.dart';
import 'tools/cat_info_extended.dart';
import 'tools/utils.dart';

class InfoPage extends StatelessWidget {

  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final index = ((ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map)['index'] as int;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: Utils.getWidth(context),
          height: Utils.getHeight(context),
          child: CatInfoExtended(index: index),
        )
      )
    );
  }
}