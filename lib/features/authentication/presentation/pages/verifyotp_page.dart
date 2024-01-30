import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_auth/core/themes/app_theme.dart';
import 'package:movie_app_auth/features/authentication/presentation/provider/auth_provider.dart';
import 'package:movie_app_auth/features/authentication/presentation/widgets/textfield_widget.dart';

class OtpVerificationPage extends HookConsumerWidget {
  const OtpVerificationPage({super.key});
  static const routePath = '/loginwithotp';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mobileController = useTextEditingController();
    final maindata = ref.read(authenticationProvider.notifier);
    final theme = AppTheme.of(context);

    return Scaffold(
      backgroundColor: theme.colors.secondary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFieldWidget(
                  text: mobileController.text, controller: mobileController),
              SizedBox(
                height: theme.spaces.space_300,
              ),
              ElevatedButton(
                  onPressed: () {
                    maindata.verifyOtp(context, mobileController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(
                        horizontal: AppTheme.of(context).spaces.space_700 * 2,
                        vertical: AppTheme.of(context).spaces.space_200),
                  ),
                  child: Text(
                    "Verify OTP",
                    style: AppTheme.of(context)
                        .typography
                        .h500
                        .copyWith(color: Colors.white),
                  )),
              SizedBox(
                height: theme.spaces.space_800 * 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
