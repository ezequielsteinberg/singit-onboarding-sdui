import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseStateNotifier<T> extends StateNotifier<T> {
  BaseStateNotifier(super.state);

  void setLoading();
  void setError(String message);
  void setSuccess(T data);
}
