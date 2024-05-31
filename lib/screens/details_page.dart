import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/art_objects.dart';
import '../providers/details_page_provider.dart';
import '../widgets/height_spacer.dart';
import '../widgets/hero_image.dart';

class DetailsPage extends StatefulWidget {
  final String? imageUrl;

  const DetailsPage({
    super.key,
    required this.objectNumber,
    required this.imageUrl,
  });
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
    final artObject = provider.artItem.getOrElse(ArtObjects.new);

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            icon: Icon(Icons.adaptive.arrow_back, color: Theme.of(context).scaffoldBackgroundColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          expandedHeight: 300,
          stretch: true,
          flexibleSpace: FlexibleSpaceBar(
            background: HeroImage(
              objectNumber: widget.objectNumber,
              imageUrl: widget.imageUrl,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: HeightSpacer()),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              artObject.title ?? '',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: HeightSpacer(height: 8)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              artObject.description ?? '',
            ),
          ),
        ),
      ],
    ));
  }
}
