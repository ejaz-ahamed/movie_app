import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_auth/core/constants/login_constants.dart';
import 'package:movie_app_auth/core/themes/app_theme.dart';
import 'package:movie_app_auth/features/authentication/presentation/pages/home_page.dart';
import 'package:movie_app_auth/features/authentication/presentation/provider/auth_provider.dart';

class LoginButtonWidget extends ConsumerWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.read(authenticationProvider(context).notifier).emailController;
    final password =
        ref.read(authenticationProvider(context).notifier).passwordController;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.of(context).colors.backgroundDanger,
          padding: EdgeInsets.symmetric(
              horizontal: AppTheme.of(context).spaces.space_800 * 2,
              vertical: AppTheme.of(context).spaces.space_150),
        ),
        onPressed: () {
          if (FirebaseAuth.instance.currentUser == null) {
            ref
                .read(authenticationProvider(context).notifier)
                .signInWithEmail(email.text, password.text);
          } else {
            context.go(HomePage.routePath);
          }
        },
        child: Text(
          ref.watch(logConstProvider).btn1,
          style: AppTheme.of(context)
              .typography
              .h500
              .copyWith(color: Colors.white),
        ));
  }
}
