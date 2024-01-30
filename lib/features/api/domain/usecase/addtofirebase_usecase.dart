import 'package:movie_app_auth/core/exceptions/base_exception.dart';
import 'package:movie_app_auth/features/api/domain/entity/movie_entity.dart';
import 'package:movie_app_auth/features/api/domain/repository/firebase_firestore_repository.dart';

final class AddToFireStoreUsecase {
  final FireBaseFireStoreRepository repository;
  AddToFireStoreUsecase({required this.repository});

  Future<void> call(MovieEntity entity) async {
    try {
      await repository.addtofirestore(entity);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
