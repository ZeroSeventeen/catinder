import 'api_key.dart';

class CatApi {
  CatApi._();
  static const String baseUrl = "https://api.thecatapi.com/v1";
  static const String getCats = "$baseUrl/images/search/";
  static const String request = "$getCats?has_breeds=1&api_key=${ApiKey.apikey}";

}
