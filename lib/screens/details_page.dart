import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../enums/notifier_state.dart';
import '../models/art_objects.dart';
import '../providers/details_page_provider.dart';
import '../widgets/loading_indicator.dart';

class DetailsPage extends StatefulWidget {
  final String? imageUrl;

  const DetailsPage({
    Key? key,
    required this.objectNumber,
    required this.imageUrl,
  }) : super(key: key);
  final String? objectNumber;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _viewDidLoad());

    super.initState();
  }

  void _viewDidLoad() => context.read<DetailsPageProvider>().getArtItemBy(
        objectNumber: widget.objectNumber,
      );

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DetailsPageProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          provider.artItem.fold<String>((l) => '', (r) => r.title ?? ''),
        ),
      ),
      body: ListView(
        children: [
          HeroImage(
            objectNumber: widget.objectNumber,
            imageUrl: widget.imageUrl,
          ),
          const HeightSpacer(),
          provider.artItem.foldRight(
            Container(),
            (r, _) => DetailsCard(item: r),
          ),
        ],
      ),
    );
  }
}

class HeroImage extends StatelessWidget {
  const HeroImage({
    Key? key,
    this.objectNumber,
    this.imageUrl,
    this.height,
    this.width,
  }) : super(key: key);

  final String? objectNumber;
  final String? imageUrl;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) => Hero(
        tag: objectNumber ?? '',
        child: CachedNetworkImage(
          imageUrl: imageUrl ?? '',
          height: height,
          width: width,
          memCacheHeight: (MediaQuery.of(context).size.height * 0.7).toInt(),
          fit: BoxFit.cover,
        ),
      );
}

class DetailsCard extends StatelessWidget {
  const DetailsCard({
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

class HeightSpacer extends StatelessWidget {
  const HeightSpacer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const SizedBox(height: 16);
}
