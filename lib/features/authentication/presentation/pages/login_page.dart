import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_auth/core/constants/login_constants.dart';
import 'package:movie_app_auth/core/themes/app_theme.dart';
import 'package:movie_app_auth/core/widgets/elevatedbtn_widget.dart';
import 'package:movie_app_auth/features/authentication/presentation/widgets/elevatedbutton_widget.dart';
import 'package:movie_app_auth/features/authentication/presentation/widgets/textfield_widget.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
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
                Text(
                  ref.watch(logConstProvider).textfield1,
                  style: AppTheme.of(context).typography.h500,
                ),
                TextFieldWidget(
                    text: ref.watch(logConstProvider).textfield1text),
                SizedBox(
                  height: AppTheme.of(context).spaces.space_150,
                ),
                Text(
                  ref.watch(logConstProvider).textfield2,
                  style: AppTheme.of(context).typography.h500,
                ),
                TextFieldWidget(
                    text: ref.watch(logConstProvider).textfield2text),
                SizedBox(
                  height: AppTheme.of(context).spaces.space_300 * 2,
                ),
                const ElevatedButtonWidget(),
                const ElevatedButtonWidgetConst(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
