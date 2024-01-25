import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_auth/core/constants/login_constants.dart';
import 'package:movie_app_auth/core/themes/app_theme.dart';
import 'package:movie_app_auth/features/api/presentation/pages/home_page.dart';
import 'package:movie_app_auth/features/authentication/presentation/provider/auth_provider.dart';

class LoginButtonWidget extends ConsumerWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginButtonWidget(
      {super.key,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.of(context).colors.backgroundDanger,
          padding: EdgeInsets.symmetric(
              horizontal: AppTheme.of(context).spaces.space_800 * 2,
              vertical: AppTheme.of(context).spaces.space_150),
        ),
        onPressed: () {
          ref
              .read(authenticationProvider(context).notifier)
              .signInWithEmail(emailController.text, passwordController.text);
          context.go(HomePage.routePath);
        },
        child: ref.watch(authenticationProvider(context))
            ? const CircularProgressIndicator()
            : Text(
                ref.watch(logConstProvider).btn1,
                style: AppTheme.of(context)
                    .typography
                    .h500
                    .copyWith(color: Colors.white),
              ));
  }
}
