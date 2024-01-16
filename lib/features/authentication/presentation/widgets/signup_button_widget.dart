import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_auth/core/constants/login_constants.dart';
import 'package:movie_app_auth/core/themes/app_theme.dart';
import 'package:movie_app_auth/features/authentication/presentation/provider/auth_provider.dart';

class SignUpButtonWidget extends ConsumerWidget {
  const SignUpButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.read(authenticationProvider(context).notifier).emailController;
    final password =
        ref.read(authenticationProvider(context).notifier).passwordController;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.of(context).colors.backgroundDanger,
          padding: EdgeInsets.symmetric(
              horizontal: AppTheme.of(context).spaces.space_800 * 1.9,
              vertical: AppTheme.of(context).spaces.space_150),
        ),
        onPressed: () {
          ref.read(authenticationProvider(context).notifier).signUpWithEmail(
                email.text,
                password.text,
              );
          ref.read(authenticationProvider(context).notifier).clear();
        },
        child: Text(
          ref.watch(logConstProvider).link,
          style: AppTheme.of(context)
              .typography
              .h500
              .copyWith(color: Colors.white),
        ));
  }
}
