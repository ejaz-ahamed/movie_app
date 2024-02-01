import 'package:flutter/material.dart';

class YoutubeButtonWidget extends StatelessWidget {
  const YoutubeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
