import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_auth/core/constants/api_constants.dart';
import 'package:movie_app_auth/features/api/domain/entity/movie_entity.dart';
import 'package:movie_app_auth/features/api/presentation/pages/sec_page.dart';

class GridViewWidget extends ConsumerWidget {
  final List<MovieEntity> entity;
  const GridViewWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      itemCount: entity.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 200,
          mainAxisSpacing: 15,
          crossAxisSpacing: 10),
      itemBuilder: (context, index) => InkWell(
        onTap: () => context.push(OverViewPage.routePath, extra: entity[index]),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      ApiConstants.imagePath + entity[index].posterPath),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
