import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_auth/core/themes/app_theme.dart';
import 'package:movie_app_auth/features/api/presentation/provider/movie_provider.dart';

class SearchTextFieldWidget extends ConsumerWidget {
  final String? text;
  final TextEditingController controller;
  const SearchTextFieldWidget(
      {super.key, required this.text, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      cursorColor: AppTheme.of(context).colors.text,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: AppTheme.of(context).spaces.space_250,
              vertical: AppTheme.of(context).spaces.space_200),
          hintText: text,
          hintStyle: const TextStyle(color: Colors.white60),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                BorderSide(color: AppTheme.of(context).colors.textSubtle),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                BorderSide(color: AppTheme.of(context).colors.textSubtle),
          ),
          suffixIcon: IconButton(
              onPressed: () {
                ref.read(movieProvider.notifier).searchMovies(controller.text,context);
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white70,
                size: 30,
              ))),
    );
  }
}
