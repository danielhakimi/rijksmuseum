import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../enums/notifier_state.dart';
import '../providers/home_page_provider.dart';
import 'loading_indicator.dart';

class LoadingListItem extends StatelessWidget {
  const LoadingListItem({
    super.key,
  });

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
              child: const LoadingIndicator(),
            ),
          ),
        ],
      );
}
