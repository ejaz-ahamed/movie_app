import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_auth/core/themes/app_theme.dart';
import 'package:movie_app_auth/core/themes/color_palette_themes.dart';
import 'package:movie_app_auth/features/api/presentation/pages/favourite_movies_page.dart';
import 'package:movie_app_auth/features/api/presentation/pages/home_page.dart';
import 'package:movie_app_auth/features/api/presentation/pages/search_page.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: AppColorPalette.black.withOpacity(.80),
      selectedItemColor: Colors.white,
      unselectedItemColor: AppTheme.of(context).colors.textSubtlest,
      iconSize: AppTheme.of(context).spaces.space_400,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  context.go(HomePage.routePath);
                },
                icon: const Icon(Icons.home_filled)),
            label: ''),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  context.push(SearchPage.routePath);
                },
                icon: const Icon(Icons.search)),
            label: ''),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  context.push(FavouriteMoviesPage.routePath);
                },
                icon: const Icon(Icons.favorite)),
            label: ''),
      ],
    );
  }
}
