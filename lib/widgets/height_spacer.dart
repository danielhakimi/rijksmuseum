import 'package:flutter/widgets.dart';

class HeightSpacer extends StatelessWidget {
  final double height;

  const HeightSpacer({
    super.key,
    this.height = 16.0,
  });

  @override
  Widget build(BuildContext context) => SizedBox(height: height);
}
