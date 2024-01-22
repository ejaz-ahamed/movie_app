import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_auth/core/constants/login_constants.dart';
import 'package:movie_app_auth/core/themes/app_theme.dart';
import 'package:movie_app_auth/core/widgets/elevatedbtn_widget.dart';
import 'package:movie_app_auth/features/authentication/presentation/pages/home_page.dart';
import 'package:movie_app_auth/features/authentication/presentation/pages/mobileauth_page.dart';
import 'package:movie_app_auth/features/authentication/presentation/pages/signup_page.dart';
import 'package:movie_app_auth/features/authentication/presentation/provider/auth_provider.dart';
import 'package:movie_app_auth/features/authentication/presentation/widgets/loginbutton_widget.dart';
import 'package:movie_app_auth/features/authentication/presentation/widgets/textfield_widget.dart';

class LoginPage extends HookConsumerWidget {
  static const routePath = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController emailController = useTextEditingController();
    final TextEditingController passwordController = useTextEditingController();
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
                    height: AppTheme.of(context).spaces.space_800 * 2,
                  ),
                  Text(ref.watch(logConstProvider).title,
                      style: AppTheme.of(context).typography.h800),
                  Text(ref.watch(logConstProvider).subtitle,
                      style: AppTheme.of(context).typography.h500),
                  SizedBox(
                    height: AppTheme.of(context).spaces.space_800,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ref.watch(logConstProvider).textfield1,
                        style: AppTheme.of(context).typography.h500,
                      ),
                    ],
                  ),
                  TextFieldWidget(
                      controller: emailController,
                      text: ref.watch(logConstProvider).textfield1text),
                  SizedBox(
                    height: AppTheme.of(context).spaces.space_150,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ref.watch(logConstProvider).textfield2,
                        style: AppTheme.of(context).typography.h500,
                      ),
                    ],
                  ),
                  TextFieldWidget(
                      controller: passwordController,
                      text: ref.watch(logConstProvider).textfield2text),
                  SizedBox(
                    height: AppTheme.of(context).spaces.space_50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          ref
                              .read(authenticationProvider(context).notifier)
                              .forgetPassword(emailController.text);
                        },
                        child: Text(
                          ref.watch(logConstProvider).forget,
                          style: AppTheme.of(context)
                              .typography
                              .h500
                              .copyWith(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppTheme.of(context).spaces.space_200 * 2,
                  ),
                  LoginButtonWidget(
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  SizedBox(
                    height: AppTheme.of(context).spaces.space_150,
                  ),
                  ElevatedButtonWidgetConst(
                    onPressed: () {
                      context.go(MobileAuthPage.routePath);
                    },
                    logoLink: Image.asset(
                      "assets/images/phone-call.png",
                      width: AppTheme.of(context).spaces.space_300,
                    ),
                    text: ref.watch(logConstProvider).phonetitle,
                  ),
                  SizedBox(
                    height: AppTheme.of(context).spaces.space_150,
                  ),
                  ElevatedButtonWidgetConst(
                    onPressed: () {
                      ref
                          .read(authenticationProvider(context).notifier)
                          .signinWithGoogle();
                      context.go(HomePage.routePath);
                    },
                    logoLink: Image.network(
                      ref.watch(logConstProvider).logolink,
                      width: AppTheme.of(context).spaces.space_400,
                    ),
                    text: ref.watch(logConstProvider).btn2,
                  ),
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
                          context.go(SignUpPage.routePath);
                        },
                        child: Text(
                          ref.watch(logConstProvider).link,
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
