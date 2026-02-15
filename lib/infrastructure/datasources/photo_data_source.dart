import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/photo_dto.dart';

part 'photo_data_source.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class PhotoDataSource {
  factory PhotoDataSource(Dio dio, {String baseUrl}) = _PhotoDataSource;

  @GET("/photos")
  Future<List<PhotoDto>> getPhotos();
}
