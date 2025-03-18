import 'tools/cat_info.dart';
import 'package:flutter/material.dart';

class CatCardT extends StatelessWidget {

  // final void Function(DismissDirection)? onDismissed;

  @override
  Widget build(BuildContext context) {

    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5.0,
        child: CatInfo()
    );
  }
}
