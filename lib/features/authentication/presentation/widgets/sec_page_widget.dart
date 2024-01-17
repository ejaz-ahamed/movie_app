import 'package:flutter/material.dart';
import 'package:movie_app_auth/features/authentication/domain/entity/movie_entity.dart';

const imagePath = 'https://image.tmdb.org/t/p/original';

class MyHerp extends StatelessWidget {
  static const routePath = '/herp';
  final MovieEntity modelData;
  const MyHerp({
    super.key,
    required this.modelData,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 31, 31),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height / 2,
            color: Colors.black87,
            child: Image.network("$imagePath${modelData.posterPath}"),
          )
        ],
      ),
    );
  }
}
