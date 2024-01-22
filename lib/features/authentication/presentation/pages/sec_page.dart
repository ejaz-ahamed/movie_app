import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_auth/core/constants/api_constants.dart';
import 'package:movie_app_auth/core/themes/app_theme.dart';
import 'package:movie_app_auth/features/authentication/domain/entity/movie_entity.dart';

class OverViewPage extends StatefulWidget {
  static const routePath = '/overview';
  final MovieEntity entity;

  const OverViewPage({
    super.key,
    required this.entity,
  });

  @override
  State<OverViewPage> createState() => _OverViewPageState();
}

class _OverViewPageState extends State<OverViewPage> {
  bool isExpanded = false;

  final imagePath = ApiConstants.imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 31, 31),
      ),
      backgroundColor: const Color.fromARGB(255, 32, 31, 31),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height / 2.5,
              color: Colors.black87,
              child: Image.network("$imagePath${widget.entity.posterPath}"),
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_125,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: widget.entity.title,
                    style: AppTheme.of(context)
                        .typography
                        .h600
                        .copyWith(color: Colors.white),
                    children: [
                      TextSpan(
                        text: "    ⭐${widget.entity.voteAverage}",
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
                text: isExpanded
                    ? widget.entity.overview
                    : widget.entity.overview.substring(0, 125),
                style: const TextStyle(color: Colors.white54),
                children: [
                  TextSpan(
                    text: isExpanded ? ' Read Less...' : ' Read More...',
                    style: AppTheme.of(context)
                        .typography
                        .h400
                        .copyWith(color: Colors.white60),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
