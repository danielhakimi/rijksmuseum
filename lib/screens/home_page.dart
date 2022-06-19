import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/art_objects.dart';
import '../services/museum_data_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController1 = ScrollController();

  int page = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        scrollController1.addListener(pagination);
        context.read<HomePageProvider>().getFirstPage();
      },
    );
    super.initState();
  }

  void pagination() {
    // print("pixels: ${scrollController1.position.pixels}");
    // print("max: ${scrollController1.position.maxScrollExtent}");
    if (scrollController1.position.pixels >=
        scrollController1.position.maxScrollExtent - 300) {
      setState(() {
        page += 1;
        context.read<HomePageProvider>().getBy(page: page);
      });
    }
  }

  @override
  Widget build(BuildContext context) => Consumer<HomePageProvider>(
        builder: (context, provider, child) => Stack(
          children: [
            Scaffold(
              body: CustomScrollView(
                controller: scrollController1,
                slivers: [
                  const SliverPadding(
                    padding: EdgeInsets.only(bottom: 16),
                    sliver: SliverAppBar(
                      title: Text('Rijksmuseum'),
                      floating: true,
                    ),
                  ),
                  provider.artItems.fold(
                    (l) => Text(l.message),
                    (items) => SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: items.length + 1,
                        (context, index) {
                          if (items.isEmpty) {
                            return const Offstage();
                          }

                          return items.length == index
                              ? const LoadingListItem()
                              : Card(artItem: items[index]);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (provider.state == NotifierState.loading)
              const Align(child: CircularProgressIndicator()),
          ],
        ),
      );
}

class LoadingListItem extends StatelessWidget {
  const LoadingListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1000),
              opacity: context.select<HomePageProvider, NotifierState>(
                        (value) => value.pagingState,
                      ) ==
                      NotifierState.loading
                  ? 1
                  : 0,
              child: const CircularProgressIndicator(),
            ),
          ),
        ],
      );
}

class Card extends StatelessWidget {
  final ArtObjects? artItem;

  const Card({
    Key? key,
    this.artItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (artItem?.hasImage == false)
                  const SizedBox(height: 0)
                else
                  CachedNetworkImage(
                    imageUrl: artItem?.webImage?.url ?? '',
                    height: 100,
                    width: 100,
                    memCacheHeight: 100,
                    fit: BoxFit.cover,
                  ),
                Expanded(
                  child: CardDescription(artItem: artItem),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
}

class CardDescription extends StatelessWidget {
  const CardDescription({
    Key? key,
    required this.artItem,
  }) : super(key: key);

  final ArtObjects? artItem;

  @override
  Widget build(BuildContext context) {
    final arr = artItem?.longTitle?.split(',');
    arr?.removeAt(0);
    final newTitle = arr?.join(',').trimLeft();

    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            artItem?.title ?? '',
            style: textTheme.titleMedium,
          ),
          const SizedBox(height: 4),
          Text(
            newTitle ?? '',
            style: textTheme.caption,
          ),
        ],
      ),
    );
  }
}
