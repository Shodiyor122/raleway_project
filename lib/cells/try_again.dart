import 'package:flutter/material.dart';
import 'package:ralewayapp/cells/button.dart';
import 'package:ralewayapp/theme/style.dart';

class TryAgain extends StatelessWidget {
  final Function() onTapTryAgain;
  const TryAgain({Key? key, required this.onTapTryAgain}) : super(key: key);

  Widget tryAgainButton(BuildContext context) =>
      Button.border(onPressed: onTapTryAgain, text: 'Try again');

  Widget viewBody(BuildContext context) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Check internet and try again',
                style: Style.body3w4, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            tryAgainButton(context)
          ]);

  Widget view(BuildContext context) => Center(
      child: Container(
          padding: Style.padding16,
          decoration: BoxDecoration(
              color: Style.colors.background, borderRadius: Style.border8),
          child: viewBody(context)));

  @override
  Widget build(BuildContext context) => view(context);
}
