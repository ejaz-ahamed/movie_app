import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_auth/core/constants/api_constants.dart';
import 'package:movie_app_auth/core/themes/app_theme.dart';
import 'package:movie_app_auth/features/api/domain/entity/movie_entity.dart';
import 'package:movie_app_auth/features/api/presentation/pages/sec_page.dart';

class CarouselWidget extends ConsumerWidget {
  final images = ApiConstants.imagePath;
  final List<MovieEntity> list;
  const CarouselWidget({super.key, required this.list});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CarouselSlider.builder(
      itemCount: list.length,
      itemBuilder: (context, index, realIndex) {
        final posterPathFile = File(list[index].posterPath);
        late final ImageProvider image;
        if (posterPathFile.existsSync()) {
          image = FileImage(posterPathFile);
        } else {
          image = NetworkImage(
            images + list[index].posterPath,
          );
        }
        return InkWell(
          onTap: () => context.push(OverViewPage.routePath, extra: list[index]),
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppTheme.of(context).colors.textSubtle,
                image: DecorationImage(image: image, fit: BoxFit.fill)),
          ),
        );
      },
      options: CarouselOptions(
        height: 270,
        viewportFraction: 0.5,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
      ),
    );
  }
}
