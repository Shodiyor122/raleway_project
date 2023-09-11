import 'package:flutter/cupertino.dart';
import 'package:ralewayapp/theme/style.dart';

class ActivityIndicator extends StatelessWidget {
  final Color? color;
  final EdgeInsetsGeometry? padding;

  const ActivityIndicator({Key? key, this.color, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) => CupertinoTheme(
      data:
          CupertinoTheme.of(context).copyWith(brightness: Style.appBrightness),
      child: Padding(
          padding: padding ?? Style.padding0,
          child: Container(
              color: color ?? Style.colors.transparent,
              child: const Center(child: CupertinoActivityIndicator()))));
}
