import 'package:movie_app_auth/core/exceptions/base_exception.dart';
import 'package:movie_app_auth/features/api/domain/repository/firebase_firestore_repository.dart';

final class DeleteFromFirebaseUseCase {
  final FireBaseFireStoreRepository repository;
  DeleteFromFirebaseUseCase({required this.repository});

  Future<void> call(String id) async {
    try {
      await repository.deleteFromFireStore(id);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
