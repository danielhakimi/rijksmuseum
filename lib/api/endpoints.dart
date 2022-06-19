import '../envify/env.dart';

const String collection = '${Env.apiUrl}/collection?key=${Env.apiToken}';
String collectionDetails({required String objectNumber}) =>
    '${Env.apiUrl}/collection/$objectNumber?key=${Env.apiToken}';
