import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_auth/features/api/domain/entity/movie_entity.dart';

class YoutubeButtonWidget extends ConsumerWidget {
  final MovieEntity entity;
  const YoutubeButtonWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFCD201F),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80)),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.play_arrow_rounded,
              color: Colors.white,
              size: 40,
            ),
            Text(
              "Play Trailer",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ));
  }
}
