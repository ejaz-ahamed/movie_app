import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_auth/core/themes/app_theme.dart';

class ElevatedButtonWidgetConst extends ConsumerWidget {
  final void Function()? onPressed;
  final Widget logoLink;
  final String text;
  const ElevatedButtonWidgetConst({
    super.key,
    required this.onPressed,
    required this.logoLink,
    required this.text,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.of(context).colors.textInverse,
          elevation: 0.5,
          padding: EdgeInsets.symmetric(
              vertical: AppTheme.of(context).spaces.space_100),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logoLink,
            SizedBox(
              width: AppTheme.of(context).spaces.space_200,
            ),
            Text(
              text,
              style: AppTheme.of(context).typography.h400,
            ),
          ],
        ));
  }
}
