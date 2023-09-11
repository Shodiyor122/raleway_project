import 'package:flutter/cupertino.dart';
import 'package:ralewayapp/theme/style.dart';

class CustomToast extends StatelessWidget {
  final String? title;
  final bool isError;
  const CustomToast({
    Key? key,
    @required this.title,
    this.isError = false,
  }) : super(key: key);

  Widget get titleWidget => Text(title!,
      style: Style.body2w3.copyWith(color: Style.colors.white),
      textAlign: TextAlign.center);

  Widget get view => Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
          borderRadius: Style.border10,
          color: (isError ? Style.colors.error : Style.colors.primary)
              .withOpacity(0.8)),
      child: titleWidget);
  @override
  Widget build(BuildContext context) => view;
}
