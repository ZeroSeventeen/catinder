
class Cat {
  final String imageUrl;
  final BreedsInfo breedsInfo;

  Cat({required this.imageUrl, required this.breedsInfo});

  factory Cat.fromJson(Map json) {
    return Cat(imageUrl: json['url'], breedsInfo: BreedsInfo.fromJson(json['breeds'][0]));
  }
}

class BreedsInfo {
  final String name;
  final dynamic weight;
  final String temperament;
  final String origin;
  final String lifeSpan;
  final String wikiUrl;

  BreedsInfo({required this.name, required this.weight, required this.temperament,
    required this.origin, required this.lifeSpan, required this.wikiUrl});

  factory BreedsInfo.fromJson(Map json) {
    return BreedsInfo(name: json['name'], weight: json['weight'], temperament: json['temperament'],
        origin: json['origin'], lifeSpan: json['life_span'], wikiUrl: json['wikipedia_url']);
  }
}

class EmptyCat extends Cat {
  EmptyCat() : super(imageUrl: "", breedsInfo: EmptyBreedsInfo());
}

class EmptyBreedsInfo extends BreedsInfo {

  EmptyBreedsInfo() : super(
    name: "Error occurred. No info",
    weight: "no info",
    temperament: "no info",
    origin: "no info",
    lifeSpan: "no info",
    wikiUrl: "no info");
}