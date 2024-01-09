import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_auth/core/constants/login_constants.dart';
import 'package:movie_app_auth/core/themes/app_theme.dart';

class ElevatedButtonWidgetConst extends ConsumerWidget {
  const ElevatedButtonWidgetConst({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.of(context).colors.textInverse,
          elevation: 0.5,
          padding: EdgeInsets.symmetric(
              vertical: AppTheme.of(context).spaces.space_150),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              ref.watch(logConstProvider).logolink,
              width: AppTheme.of(context).spaces.space_250,
            ),
            Text(
              ref.watch(logConstProvider).btn2,
            ),
          ],
        ));
  }
}