import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_auth/core/constants/login_constants.dart';
import 'package:movie_app_auth/core/themes/app_theme.dart';
import 'package:movie_app_auth/features/authentication/presentation/provider/auth_provider.dart';

class SignUpButtonWidget extends HookConsumerWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const SignUpButtonWidget(
      {super.key,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.of(context).colors.backgroundDanger,
          padding: EdgeInsets.symmetric(
              horizontal: AppTheme.of(context).spaces.space_800 * 1.9,
              vertical: AppTheme.of(context).spaces.space_150),
        ),
        onPressed: () {
          ref.read(authenticationProvider(context).notifier).signUpWithEmail(
                emailController.text,
                passwordController.text,
              );
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
