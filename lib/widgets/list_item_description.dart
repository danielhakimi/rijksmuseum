import 'package:flutter/material.dart';

import '../extensions/art_object_string_extension.dart';
import '../models/art_objects.dart';

class ListItemDescription extends StatelessWidget {
  const ListItemDescription({
    Key? key,
    required this.artItem,
  }) : super(key: key);

  final ArtObjects? artItem;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            artItem?.title ?? '',
            style: textTheme.titleMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
          const SizedBox(height: 4),
          Text(
            artItem?.buildTitle() ?? '',
            style: textTheme.caption,
          ),
        ],
      ),
    );
  }
}
