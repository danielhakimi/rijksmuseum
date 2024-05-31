import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../enums/notifier_state.dart';

import '../providers/home_page_provider.dart';
import '../widgets/list_item.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/loading_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _viewDidLoad());
    super.initState();
  }

  void _viewDidLoad() {
    context.read<HomePageProvider>().getFirstPage();

    scrollController.addListener(
      () => context.read<HomePageProvider>().onScroll(
            pixels: scrollController.position.pixels,
            maxScrollExtent: scrollController.position.maxScrollExtent,
          ),
    );
  }

  @override
  Widget build(BuildContext context) => Consumer<HomePageProvider>(
        builder: (context, provider, child) => Stack(
          children: [
            Scaffold(
              body: CustomScrollView(
                controller: scrollController,
                slivers: [
                  const SliverPadding(
                    padding: EdgeInsets.only(bottom: 16),
                    sliver: SliverAppBar(
                      title: Text('Rijksmuseum'),
                      floating: true,
                    ),
                  ),
                  provider.items.fold(
                    (l) => SliverToBoxAdapter(
                      child: Center(child: Text(l.message)),
                    ),
                    (items) => SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: items.length + 1,
                        (context, index) {
                          if (items.isEmpty) {
                            return const Offstage();
                          }

                          return items.length == index
                              ? const LoadingListItem()
                              : ListItem(item: items[index]);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (provider.state == NotifierState.loading)
              const Align(child: LoadingIndicator()),
          ],
        ),
      );
}
