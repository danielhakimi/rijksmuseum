import '../envify/env.dart';

const String apiUrl = 'https://www.rijksmuseum.nl/api/nl';
const String collection = '$apiUrl/collection?key=${Env.apiToken}';
String collectionDetails({required String objectNumber}) =>
    '$apiUrl/collection/$objectNumber?key=${Env.apiToken}';
