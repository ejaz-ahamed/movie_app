import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_auth/core/constants/login_constants.dart';
import 'package:movie_app_auth/core/themes/app_theme.dart';

class ElevatedButtonWidget extends ConsumerWidget {
  const ElevatedButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.of(context).colors.backgroundDanger,
          padding: EdgeInsets.symmetric(
              horizontal: AppTheme.of(context).spaces.space_800 * 2,
              vertical: AppTheme.of(context).spaces.space_150),
        ),
        onPressed: () {},
        child: Text(
          ref.watch(logConstProvider).btn1,
          style: TextStyle(color: AppTheme.of(context).colors.textInverse),
        ));
  }
}
