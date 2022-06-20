import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../enums/notifier_state.dart';
import '../models/art_objects.dart';
import '../providers/details_page_provider.dart';
import 'height_spacer.dart';
import 'loading_indicator.dart';

class ItemDetailsInformation extends StatelessWidget {
  const ItemDetailsInformation({
    Key? key,
    required this.item,
  }) : super(key: key);
  final ArtObjects item;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DetailsPageProvider>();
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      children: [
        AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: provider.state == NotifierState.loaded ? 1 : 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title ?? '',
                  style: textTheme.headlineSmall,
                ),
                const HeightSpacer(),
                Text(
                  item.description ?? '',
                  style: textTheme.bodyMedium,
                ),
                const HeightSpacer(),
                Text(
                  item.subTitle ?? '',
                  style: textTheme.bodySmall,
                ),
                const HeightSpacer(),
              ],
            ),
          ),
        ),
        if (provider.state == NotifierState.loading)
          const Center(
            child: LoadingIndicator(),
          ),
      ],
    );
  }
}
