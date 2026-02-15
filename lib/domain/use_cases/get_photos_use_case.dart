import '../entities/photo.dart';
import '../repositories/photo_repository.dart';

class GetPhotosUseCase {
  final PhotoRepository _repository;

  GetPhotosUseCase(this._repository);

  Future<List<Photo>> call() {
    return _repository.getPhotos();
  }
}
