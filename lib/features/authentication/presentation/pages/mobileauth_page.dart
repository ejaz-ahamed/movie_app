import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_auth/core/constants/login_constants.dart';
import 'package:movie_app_auth/core/constants/signup_constants.dart';
import 'package:movie_app_auth/core/themes/app_theme.dart';
import 'package:movie_app_auth/features/authentication/presentation/provider/auth_provider.dart';
import 'package:movie_app_auth/features/authentication/presentation/widgets/textfield_widget.dart';

class MobileAuthPage extends HookConsumerWidget {
  static const routePath = '/mob';
  const MobileAuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mobileController = useTextEditingController();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppTheme.of(context).spaces.space_300),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    ref.watch(logConstProvider).phonetitle,
                    style: AppTheme.of(context).typography.h800,
                  ),
                  Text(ref.watch(logConstProvider).phoneSubtitle,
                      style: AppTheme.of(context).typography.h500),
                  SizedBox(
                    height: AppTheme.of(context).spaces.space_800,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ref.watch(signConstProvider).textfield2,
                        style: AppTheme.of(context).typography.h500,
                      ),
                    ],
                  ),
                  TextFieldWidget(
                      controller: mobileController,
                      text: ref.watch(signConstProvider).textfield2text),
                  SizedBox(
                    height: AppTheme.of(context).spaces.space_800,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ref
                            .read(authenticationProvider.notifier)
                            .signInWithPhone(context, mobileController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                AppTheme.of(context).spaces.space_700 * 2,
                            vertical: AppTheme.of(context).spaces.space_200),
                      ),
                      child: Text(
                        "Send OTP",
                        style: AppTheme.of(context)
                            .typography
                            .h500
                            .copyWith(color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
