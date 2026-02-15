import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseStateNotifier<S, A> extends StateNotifier<S> {
  final Ref ref;

  BaseStateNotifier({
    required S state,
    required this.ref,
  }) : super(state);

  void reducer({required A action});
}
