import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_auth/core/constants/login_constants.dart';
import 'package:movie_app_auth/core/constants/signup_constants.dart';
import 'package:movie_app_auth/core/themes/app_theme.dart';
import 'package:movie_app_auth/features/authentication/presentation/pages/login_page.dart';
import 'package:movie_app_auth/features/authentication/presentation/provider/auth_provider.dart';
import 'package:movie_app_auth/features/authentication/presentation/widgets/signup_button_widget.dart';
import 'package:movie_app_auth/features/authentication/presentation/widgets/textfield_widget.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppTheme.of(context).spaces.space_300),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: AppTheme.of(context).spaces.space_900 * 1.5,
                  ),
                  Text(ref.watch(signConstProvider).title,
                      style: AppTheme.of(context).typography.h800),
                  Text(ref.watch(signConstProvider).subTitle,
                      style: AppTheme.of(context).typography.h500),
                  SizedBox(
                    height: AppTheme.of(context).spaces.space_400,
                  ),
                  Text(
                    ref.watch(signConstProvider).textfield,
                    style: AppTheme.of(context).typography.h500,
                  ),
                  TextFieldWidget(
                      controller: ref
                          .read(authenticationProvider.notifier)
                          .nameController,
                      text: ref.watch(signConstProvider).textfieldtext),
                  SizedBox(
                    height: AppTheme.of(context).spaces.space_150,
                  ),
                  Text(
                    ref.watch(signConstProvider).textfield2,
                    style: AppTheme.of(context).typography.h500,
                  ),
                  TextFieldWidget(
                      controller: ref
                          .read(authenticationProvider.notifier)
                          .mobileController,
                      text: ref.watch(signConstProvider).textfield2text),
                  SizedBox(
                    height: AppTheme.of(context).spaces.space_150,
                  ),
                  Text(
                    ref.watch(logConstProvider).textfield1,
                    style: AppTheme.of(context).typography.h500,
                  ),
                  TextFieldWidget(
                      controller: ref
                          .watch(authenticationProvider.notifier)
                          .emailController,
                      text: ref.watch(logConstProvider).textfield1text),
                  SizedBox(
                    height: AppTheme.of(context).spaces.space_150,
                  ),
                  Text(
                    ref.watch(logConstProvider).textfield2,
                    style: AppTheme.of(context).typography.h500,
                  ),
                  TextFieldWidget(
                      controller: ref
                          .watch(authenticationProvider.notifier)
                          .passwordController,
                      text: ref.watch(logConstProvider).textfield2text),
                  SizedBox(
                    height: AppTheme.of(context).spaces.space_300 * 2,
                  ),
                  const SignUpButtonWidget(),
                  SizedBox(
                    height: AppTheme.of(context).spaces.space_500,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ref.watch(logConstProvider).text,
                        style: AppTheme.of(context).typography.h400,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ));
                        },
                        child: Text(
                          " ${ref.watch(logConstProvider).btn1}",
                          style: TextStyle(
                              color:
                                  AppTheme.of(context).colors.backgroundDanger,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
