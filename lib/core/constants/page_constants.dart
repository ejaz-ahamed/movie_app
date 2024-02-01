import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_constants.g.dart';

class PageConstants {
  final title = "Favourite Movies";
  final serachtitle = "Search Movies";
}

@riverpod
PageConstants pageConst(PageConstRef ref) {
  return PageConstants();
}
