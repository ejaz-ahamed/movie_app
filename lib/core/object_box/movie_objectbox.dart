import 'package:movie_app_auth/features/api/data/model/movie_objectbox_entity.dart';
import 'package:movie_app_auth/objectbox.g.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class MovieObjectBox {
  static MovieObjectBox? _instance;

  late final Store store;
  late final Box<MovieEntityModel> movieBox;

  MovieObjectBox._create(this.store) {
    movieBox = store.box<MovieEntityModel>();
  }

  static MovieObjectBox get instance {
    return _instance!;
  }

  static Future<void> create() async {
    if (_instance == null) {
      final documentDirectory = await getApplicationDocumentsDirectory();
      final store = await openStore(
          directory: join(documentDirectory.path, 'FilmyBeatz'));
      _instance = MovieObjectBox._create(store);
    }
  }
}
