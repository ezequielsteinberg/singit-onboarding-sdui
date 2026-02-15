import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/photo.dart';

part 'photo_dto.freezed.dart';
part 'photo_dto.g.dart';

@freezed
class PhotoDto with _$PhotoDto {
  const factory PhotoDto({
    required int id,
    required String title,
    required String url,
    @JsonKey(name: 'thumbnailUrl') required String thumbnailUrl,
  }) = _PhotoDto;

  factory PhotoDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoDtoFromJson(json);
}

extension PhotoDtoX on PhotoDto {
  Photo toDomain() {
    return Photo(id: id, title: title, url: url, thumbnailUrl: thumbnailUrl);
  }
}
