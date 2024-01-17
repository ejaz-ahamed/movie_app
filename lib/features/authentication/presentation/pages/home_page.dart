import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_auth/core/constants/login_constants.dart';
import 'package:movie_app_auth/features/authentication/domain/entity/movie_entity.dart';
import 'package:movie_app_auth/features/authentication/presentation/provider/movie_provider.dart';
import 'package:movie_app_auth/features/authentication/presentation/widgets/sec_page_widget.dart';
import 'package:movie_app_auth/features/authentication/presentation/widgets/signoutbutton_widget.dart';

const imagePath = 'https://image.tmdb.org/t/p/original';

class HomePage extends ConsumerWidget {
  static const routePath = '/';
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
      body: switch (ref.watch(movieProvider)) {
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
                      color: const Color.fromARGB(255, 42, 47, 51),
                      child: ListView.builder(
                        itemCount: value.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                onTap: () {
                                  context.push(MyHerp.routePath,
                                      extra: (MovieEntity));
                                },
                                child: Container(
                                  height: 100,
                                  color: Colors.grey.shade800,
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Image.network(
                                          '$imagePath${value[index].posterPath}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: Center(
                                          child: Text(
                                            value[index].title,
                                            style: const TextStyle(
                                                color: Colors.white),
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
                        itemCount: value.length,
                        shrinkWrap: true,
                        // scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                onTap: () {
                                  context.push(MyHerp.routePath,
                                      extra: (MovieEntity));
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
                                          child: Image.network(
                                            '$imagePath${value[index].posterPath}',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 250,
                                        child: Center(
                                          child: Text(
                                            value[index].title,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 19),
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
        AsyncError(:final error) => Text(
            'Error: $error',
            style: const TextStyle(color: Colors.white),
          ),
        _ => const CircularProgressIndicator(),
      },
    );
  }
}
