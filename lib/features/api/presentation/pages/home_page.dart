import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_auth/core/constants/api_constants.dart';
import 'package:movie_app_auth/core/constants/login_constants.dart';
import 'package:movie_app_auth/features/api/presentation/pages/sec_page.dart';
import 'package:movie_app_auth/features/api/presentation/provider/movie_provider.dart';
import 'package:movie_app_auth/features/api/presentation/widgets/bottomnavigation_widget.dart';
import 'package:movie_app_auth/features/api/presentation/widgets/corousel_slider_widget.dart';
import 'package:movie_app_auth/features/authentication/presentation/widgets/signoutbutton_widget.dart';

class HomePage extends ConsumerWidget {
  static const routePath = '/';
  final imagePath = ApiConstants.imagePath;
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 31, 31),
      appBar: AppBar(
        title: Text(
          ref.watch(logConstProvider).appName,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 88, 90, 94),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        actions: const [SignOutButtonWidget()],
      ),
      body: SingleChildScrollView(
        child: ref.watch(movieProvider).isRefreshing
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : switch (ref.watch(movieProvider)) {
                AsyncData(:final value) => SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(1),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              height: MediaQuery.sizeOf(context).height / 2.5,
                              color: const Color.fromARGB(255, 49, 42, 51),
                              child: CarouselWidget(list: value.getMovies),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: double.infinity,
                              height: 400,
                              color: const Color.fromARGB(255, 17, 6, 6),
                              child: ListView.builder(
                                itemCount: value.getMovies.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final posterPathFile =
                                      File(value.getMovies[index].posterPath);
                                  late final Image image;
                                  if (posterPathFile.existsSync()) {
                                    image = Image.file(posterPathFile);
                                  } else {
                                    image = Image.network(
                                      ApiConstants.imagePath +
                                          value.getMovies[index].posterPath,
                                    );
                                  }
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: InkWell(
                                        onTap: () {
                                          context.push(OverViewPage.routePath,
                                              extra: value.getMovies[index]);
                                        },
                                        child: Container(
                                          height: 300,
                                          width: 200,
                                          color: Colors.grey.shade800,
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: 300,
                                                height: 200,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: image,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              SizedBox(
                                                width: 250,
                                                child: Center(
                                                  child: Text(
                                                    value
                                                        .getMovies[index].title,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                AsyncError(:final error) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Error: $error',
                          style: const TextStyle(color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () {
                              ref.invalidate(movieProvider);
                            },
                            child: const Text('Retry'))
                      ],
                    ),
                  ),
                _ => const Center(child: CircularProgressIndicator()),
              },
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
