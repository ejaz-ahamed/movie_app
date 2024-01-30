import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_auth/core/constants/api_constants.dart';
import 'package:movie_app_auth/core/themes/app_theme.dart';
import 'package:movie_app_auth/features/api/domain/entity/movie_entity.dart';
import 'package:movie_app_auth/features/api/presentation/provider/movie_provider.dart';
import 'package:movie_app_auth/features/api/presentation/widgets/youtube_button_widget.dart';

class OverViewPage extends ConsumerWidget {
  static const routePath = '/overview';
  final MovieEntity entity;

  const OverViewPage({
    super.key,
    required this.entity,
  });

  final imagePath = ApiConstants.imagePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = ref.watch(readmoreProvider);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 32, 31, 31),
      ),
      backgroundColor: const Color.fromARGB(255, 32, 31, 31),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height / 2.5,
                color: Colors.black87,
                child: Image.network("$imagePath${entity.posterPath}"),
              ),
              SizedBox(
                height: AppTheme.of(context).spaces.space_125,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: entity.title.toUpperCase(),
                      style: AppTheme.of(context)
                          .typography
                          .h600
                          .copyWith(color: Colors.white),
                      children: [
                        TextSpan(text: " (${entity.releaseDate.year})"),
                        TextSpan(
                          text: "    ⭐${entity.voteAverage}",
                          style: AppTheme.of(context)
                              .typography
                              .h500
                              .copyWith(color: Colors.yellow),
                        )
                      ]),
                ),
              ),
              SizedBox(
                height: AppTheme.of(context).spaces.space_125,
              ),
              RichText(
                text: TextSpan(
                  text: entity.overview.isEmpty
                      ? null
                      : isExpanded
                          ? entity.overview
                          : entity.overview
                              .substring(0, entity.overview.length ~/ 2),
                  style: const TextStyle(color: Colors.white54),
                  children: [
                    TextSpan(
                      text: entity.overview.isEmpty
                          ? null
                          : isExpanded
                              ? ' Read Less...'
                              : ' Read More...',
                      style: AppTheme.of(context)
                          .typography
                          .h400
                          .copyWith(color: Colors.white60),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          ref.read(readmoreProvider.notifier).state =
                              !isExpanded;
                        },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: AppTheme.of(context).spaces.space_125,
              ),
              const YoutubeButtonWidget(),
              ElevatedButton(
                onPressed: () {
                  ref.read(movieProvider.notifier).addtoFireStore(entity);
                },
                child: const Text('Add'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(movieProvider.notifier)
                      .deleteFromFireStore(entity.id);
                },
                child: const Text('remove'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
