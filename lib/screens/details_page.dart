import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/details_page_provider.dart';
import '../widgets/height_spacer.dart';
import '../widgets/hero_image.dart';
import '../widgets/item_details_information.dart';

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
          provider.artItem.fold(
            (l) => Text(l.message),
            (r) => ItemDetailsInformation(
              item: r,
            ),
          ),
          // provider.artItem.foldRight(
          //   Container(),
          //   (r, _) => ItemDetailsInformation(item: r),
          // ),
        ],
      ),
    );
  }
}
