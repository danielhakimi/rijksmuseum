import '../models/art_objects.dart';

extension ArtObjectStringExtension on ArtObjects {
  String? buildTitle() {
    final arr = longTitle?.split(',');
    arr?.removeAt(0);
    final newTitle = arr?.join(',').trimLeft();

    return newTitle;
  }
}
