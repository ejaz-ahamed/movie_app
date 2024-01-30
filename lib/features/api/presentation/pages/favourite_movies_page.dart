import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_auth/core/constants/page_constants.dart';
import 'package:movie_app_auth/features/api/presentation/provider/movie_provider.dart';
import 'package:movie_app_auth/features/api/presentation/widgets/bottomnavigation_widget.dart';
import 'package:movie_app_auth/features/api/presentation/widgets/gridview_widget.dart';

class FavouriteMoviesPage extends ConsumerWidget {
  static const routePath = '/fav';
  const FavouriteMoviesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          ref.watch(pageConstProvider).title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 32, 31, 31),
      ),
      backgroundColor: const Color.fromARGB(255, 32, 31, 31),
      body: StreamBuilder(
          stream: ref.read(movieProvider.notifier).getAllMovies(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridViewWidget(
                entity: snapshot.data!,
              );
            } else if (snapshot.hasError) {
              return TextButton(
                onPressed: () {},
                child: const Text('Retry'),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
