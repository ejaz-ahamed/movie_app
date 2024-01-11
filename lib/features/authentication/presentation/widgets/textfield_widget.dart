import 'package:flutter/material.dart';
import 'package:movie_app_auth/core/themes/app_theme.dart';

class TextFieldWidget extends StatelessWidget {
  final String? text;
  final TextEditingController controller;
  const TextFieldWidget(
      {super.key, required this.text, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppTheme.of(context).colors.text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: AppTheme.of(context).spaces.space_250,
            vertical: AppTheme.of(context).spaces.space_200),
        hintText: text,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppTheme.of(context).colors.textSubtle),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppTheme.of(context).colors.textSubtle),
        ),
      ),
    );
  }
}
