import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/art_objects.dart';
import '../providers/home_page_provider.dart';
import '../screens/details_page.dart';
import 'list_item_description.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    this.item,
  }) : super(key: key);
  final ArtObjects? item;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () =>
            context.read<HomePageProvider>().onItemTapped(artItem: item),
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (item?.hasImage == false)
                      const SizedBox(height: 0)
                    else
                      HeroImage(
                        objectNumber: item?.objectNumber,
                        imageUrl: item?.webImage?.url,
                        height: 100,
                        width: 100,
                      ),
                    Expanded(
                      child: ListItemDescription(artItem: item),
                    ),
                  ],
                ),
                const HeightSpacer(),
              ],
            ),
          ),
        ),
      );
}
