import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'rijksmuseum_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(RijksmuseumApp());
}
