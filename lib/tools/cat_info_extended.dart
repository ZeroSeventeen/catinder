import 'package:catinder/tools/cat_provider.dart';
import 'package:flutter/material.dart';

class CatInfoExtended extends StatefulWidget {

  final int index;

  const CatInfoExtended({super.key, required this.index});

  @override
  State<StatefulWidget> createState() => _CatInfoExtendedState(index: index);
}

class _CatInfoExtendedState extends State<CatInfoExtended> {

  final int index;

  _CatInfoExtendedState({required this.index});

  @override
  Widget build(BuildContext context) {
    var breedsInfo = CatProvider.getBreedsInfoByIndex(index);
    var catImage = CatProvider.getImageByIndex(index);

    return Padding(
        padding: EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            color: Colors.black12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  // flex: 3,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: catImage,
                  ),
                ),
                Divider(),
                Flexible(
                  fit: FlexFit.tight,
                  // flex: 1,
                  child: ListView(
                      padding: const EdgeInsets.all(8),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: [
                        ListTile(title: Text("Breed: ${breedsInfo.name}")),
                        ListTile(title: Text("Weight: ${breedsInfo.weight}")),
                        ListTile(title: Text("Temperament: ${breedsInfo.temperament}")),
                        ListTile(title: Text("Origin: ${breedsInfo.origin}")),
                        ListTile(title: Text("Life span: ${breedsInfo.lifeSpan}")),
                        ListTile(title: Text("Wiki url: ${breedsInfo.wikiUrl}")),
                      ]
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}