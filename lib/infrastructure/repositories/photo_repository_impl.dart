import '../../domain/entities/photo.dart';
import '../../domain/repositories/photo_repository.dart';
import '../datasources/photo_data_source.dart';
import '../models/photo_dto.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  PhotoRepositoryImpl(this._dataSource);

  @override
  Future<List<Photo>> getPhotos() async {
    final dtos = await _dataSource.getPhotos();
    return dtos.map((dto) => dto.toDomain()).toList();
  }
}
