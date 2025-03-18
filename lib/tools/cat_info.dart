import 'package:catinder/tools/cat_provider.dart';
import 'package:flutter/material.dart';
import 'utils.dart';

class CatInfo extends StatefulWidget {

  final int _catIndex = CatProvider.getIndex();

  int get index => _catIndex;

  CatInfo({super.key});

  @override
  State<StatefulWidget> createState() => CatInfoState();
}

class CatInfoState extends State<CatInfo> {

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          height: Utils.widgetHeight / 1.2,
          width: Utils.widgetWidth / 1.2,
          color: Colors.black12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                flex: 7,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/info', arguments: {'index': widget.index});
                  },
                  child: CatProvider.getImageByIndex(widget.index)
                ),
              ),
              Divider(),
              Flexible(
                fit: FlexFit.tight,
                // flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      CatProvider.getBreedsInfoByIndex(widget.index).name,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

