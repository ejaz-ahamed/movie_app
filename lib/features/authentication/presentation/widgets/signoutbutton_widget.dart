import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_auth/features/authentication/presentation/pages/login_page.dart';
import 'package:movie_app_auth/features/authentication/presentation/provider/auth_provider.dart';

class SignOutButtonWidget extends ConsumerWidget {
  const SignOutButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
        ),
        onPressed: () {
          if (FirebaseAuth.instance.currentUser != null) {
            ref.read(authenticationProvider.notifier).signout(context);
            context.go(LoginPage.routePath);
          }
        },
        child: const Icon(Icons.logout));
  }
}
