import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'extensions/option_extension.dart';
import 'models/art_objects.dart';
import 'providers/details_page_provider.dart';
import 'providers/home_page_provider.dart';
import 'screens/details_page.dart';
import 'screens/home_page.dart';
import 'services/museum_data_service.dart';

class RijksmuseumApp extends StatelessWidget {
  RijksmuseumApp({Key? key}) : super(key: key);
  final heroController = HeroController();

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.black),
          progressIndicatorTheme: ProgressIndicatorTheme.of(context).copyWith(
            color: Colors.redAccent.shade700,
          ),
        ),
        home: ChangeNotifierProvider<HomePageProvider>(
          create: (context) => HomePageProvider(
            MuseumDataService(Client()),
          ),
          builder: (ctx, _) {
            final selectedItemOption =
                ctx.select<HomePageProvider, Option<ArtObjects>>(
              (value) => value.selectedOptionItem,
            );
            final selectedItem = selectedItemOption.get(ArtObjects.new);

            return Navigator(
              pages: [
                const MaterialPage(
                  key: ValueKey('HomePage'),
                  child: HomePage(),
                ),
                if (selectedItemOption.isSome())
                  MaterialPage(
                    key: const ValueKey('DetailsPage'),
                    child: ChangeNotifierProvider<DetailsPageProvider>(
                      create: (context) => DetailsPageProvider(
                        MuseumDataService(Client()),
                      ),
                      child: DetailsPage(
                        objectNumber: selectedItem.objectNumber,
                        imageUrl: selectedItem.webImage?.url,
                      ),
                    ),
                  ),
              ],
              onPopPage: (route, result) {
                if (!route.didPop(result)) {
                  return false;
                }
                ctx.read<HomePageProvider>().resetSelectedItem();

                return true;
              },
              observers: [heroController],
            );
          },
        ),
      );
}
