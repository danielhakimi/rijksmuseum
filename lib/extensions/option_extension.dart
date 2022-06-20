import 'package:dartz/dartz.dart';

typedef ItemCreator<S> = S Function();

extension OptionExtension<T> on Option<T> {
  T get(ItemCreator<T> itemCreator) => foldRight(
        itemCreator(),
        (artItem, previous) => artItem,
      );
}
