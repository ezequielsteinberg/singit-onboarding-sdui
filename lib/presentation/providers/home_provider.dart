import '../../domain/use_cases/get_photos_use_case.dart';
import '../state/home_state.dart';
import 'base_state_notifier.dart';

class HomeProvider extends BaseStateNotifier<HomeState> {
  final GetPhotosUseCase _getPhotosUseCase;

  HomeProvider(this._getPhotosUseCase) : super(const HomeState.initial());

  Future<void> getPhotos() async {
    state = const HomeState.loading();
    try {
      final photos = await _getPhotosUseCase();
      state = HomeState.success(photos);
    } catch (e) {
      state = HomeState.error(e.toString());
    }
  }

  @override
  void setError(String message) {
    state = HomeState.error(message);
  }

  @override
  void setLoading() {
    state = const HomeState.loading();
  }

  @override
  void setSuccess(HomeState data) {
    state = data;
  }
}
