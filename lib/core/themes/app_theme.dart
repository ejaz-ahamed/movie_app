import 'package:flutter/material.dart';
import 'package:movie_app_auth/core/themes/extensions/color_extensions.dart';
import 'package:movie_app_auth/core/themes/extensions/space_extensions.dart';
import 'package:movie_app_auth/core/themes/extensions/typography_extensions.dart';

final class AppTheme {
  final BuildContext context;

  AppTheme.of(this.context);

  AppColorExtension get colors {
    return Theme.of(context).extension<AppColorExtension>()!;
  }

  AppSpaceExtension get spaces {
    return Theme.of(context).extension<AppSpaceExtension>()!;
  }

  AppTypographyExtension get typography {
    return Theme.of(context).extension<AppTypographyExtension>()!;
  }
}
