import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'screens/home_page.dart';
import 'services/museum_data_service.dart';

class RijksmuseumApp extends StatelessWidget {
  const RijksmuseumApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.black),
          progressIndicatorTheme: ProgressIndicatorTheme.of(context)
              .copyWith(color: Colors.redAccent.shade700),
        ),
        home: Navigator(
          pages: [
            MaterialPage(
              key: const ValueKey('HomePage'),
              child: ChangeNotifierProvider<HomePageProvider>(
                create: (context) => HomePageProvider(
                  MuseumDataService(Client()),
                ),
                child: const HomePage(),
              ),
            ),
          ],
          onPopPage: (route, result) => route.didPop(result),
        ),
      );
}
