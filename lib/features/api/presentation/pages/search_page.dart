import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_auth/core/constants/page_constants.dart';
import 'package:movie_app_auth/core/themes/app_theme.dart';
import 'package:movie_app_auth/features/api/presentation/provider/movie_provider.dart';
import 'package:movie_app_auth/features/api/presentation/widgets/bottomnavigation_widget.dart';
import 'package:movie_app_auth/features/api/presentation/widgets/gridview_widget.dart';
import 'package:movie_app_auth/features/api/presentation/widgets/searchtextfield_widget.dart';

class SearchPage extends HookConsumerWidget {
  static const routePath = '/search';
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: Text(
            ref.watch(pageConstProvider).serachtitle,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 32, 31, 31),
        ),
        backgroundColor: const Color.fromARGB(255, 32, 31, 31),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchTextFieldWidget(
                    text: 'Enter movie name', controller: controller),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Results :',
                  style: AppTheme.of(context)
                      .typography
                      .h600
                      .copyWith(color: Colors.white),
                ),
                Builder(
                  builder: (context) {
                    return ref.watch(movieProvider).when(
                          data: (data) {
                            if (data.searchmovies == null) {
                              return Center(
                                child: TextButton(
                                    onPressed: () {
                                      ref
                                          .read(movieProvider.notifier)
                                          .searchMovies(
                                              controller.text, context);
                                    },
                                    child: const Text(
                                      "No data available",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              );
                            } else {
                              return SizedBox(
                                  height: 700,
                                  child: GridViewWidget(
                                      entity: data.searchmovies!));
                            }
                          },
                          error: (error, stackTrace) => Center(
                            child: Text(error.toString()),
                          ),
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                  },
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(),
      ),
    );
  }
}
