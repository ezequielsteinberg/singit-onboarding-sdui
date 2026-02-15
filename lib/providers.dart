import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'domain/repositories/photo_repository.dart';
import 'domain/use_cases/get_photos_use_case.dart';
import 'infrastructure/datasources/photo_data_source.dart';
import 'infrastructure/repositories/photo_repository_impl.dart';
import 'presentation/providers/home_provider.dart';
import 'presentation/state/home_state.dart';

// Dio Provider
final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

// DataSource Provider
final photoDataSourceProvider = Provider<PhotoDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return PhotoDataSource(dio);
});

// Repository Provider
final photoRepositoryProvider = Provider<PhotoRepository>((ref) {
  final dataSource = ref.watch(photoDataSourceProvider);
  return PhotoRepositoryImpl(dataSource);
});

// UseCase Provider
final getPhotosUseCaseProvider = Provider<GetPhotosUseCase>((ref) {
  final repository = ref.watch(photoRepositoryProvider);
  return GetPhotosUseCase(repository);
});

// Home Provider
final homeProvider = StateNotifierProvider<HomeProvider, HomeState>((ref) {
  final getPhotosUseCase = ref.watch(getPhotosUseCaseProvider);
  return HomeProvider(getPhotosUseCase);
});
