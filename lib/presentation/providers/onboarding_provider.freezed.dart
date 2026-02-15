// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OnboardingState {
  bool get isLoading => throw _privateConstructorUsedError;
  OnboardingFlow? get flow => throw _privateConstructorUsedError;
  OnboardingStep? get currentStep => throw _privateConstructorUsedError;
  Map<String, String> get answers => throw _privateConstructorUsedError;
  List<OnboardingStep> get history => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnboardingStateCopyWith<OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res, OnboardingState>;
  @useResult
  $Res call(
      {bool isLoading,
      OnboardingFlow? flow,
      OnboardingStep? currentStep,
      Map<String, String> answers,
      List<OnboardingStep> history,
      String? error});

  $OnboardingFlowCopyWith<$Res>? get flow;
  $OnboardingStepCopyWith<$Res>? get currentStep;
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res, $Val extends OnboardingState>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? flow = freezed,
    Object? currentStep = freezed,
    Object? answers = null,
    Object? history = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      flow: freezed == flow
          ? _value.flow
          : flow // ignore: cast_nullable_to_non_nullable
              as OnboardingFlow?,
      currentStep: freezed == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as OnboardingStep?,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<OnboardingStep>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OnboardingFlowCopyWith<$Res>? get flow {
    if (_value.flow == null) {
      return null;
    }

    return $OnboardingFlowCopyWith<$Res>(_value.flow!, (value) {
      return _then(_value.copyWith(flow: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OnboardingStepCopyWith<$Res>? get currentStep {
    if (_value.currentStep == null) {
      return null;
    }

    return $OnboardingStepCopyWith<$Res>(_value.currentStep!, (value) {
      return _then(_value.copyWith(currentStep: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OnboardingStateImplCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$$OnboardingStateImplCopyWith(_$OnboardingStateImpl value,
          $Res Function(_$OnboardingStateImpl) then) =
      __$$OnboardingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      OnboardingFlow? flow,
      OnboardingStep? currentStep,
      Map<String, String> answers,
      List<OnboardingStep> history,
      String? error});

  @override
  $OnboardingFlowCopyWith<$Res>? get flow;
  @override
  $OnboardingStepCopyWith<$Res>? get currentStep;
}

/// @nodoc
class __$$OnboardingStateImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$OnboardingStateImpl>
    implements _$$OnboardingStateImplCopyWith<$Res> {
  __$$OnboardingStateImplCopyWithImpl(
      _$OnboardingStateImpl _value, $Res Function(_$OnboardingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? flow = freezed,
    Object? currentStep = freezed,
    Object? answers = null,
    Object? history = null,
    Object? error = freezed,
  }) {
    return _then(_$OnboardingStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      flow: freezed == flow
          ? _value.flow
          : flow // ignore: cast_nullable_to_non_nullable
              as OnboardingFlow?,
      currentStep: freezed == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as OnboardingStep?,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      history: null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<OnboardingStep>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OnboardingStateImpl implements _OnboardingState {
  const _$OnboardingStateImpl(
      {this.isLoading = false,
      this.flow,
      this.currentStep,
      final Map<String, String> answers = const {},
      final List<OnboardingStep> history = const [],
      this.error})
      : _answers = answers,
        _history = history;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final OnboardingFlow? flow;
  @override
  final OnboardingStep? currentStep;
  final Map<String, String> _answers;
  @override
  @JsonKey()
  Map<String, String> get answers {
    if (_answers is EqualUnmodifiableMapView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_answers);
  }

  final List<OnboardingStep> _history;
  @override
  @JsonKey()
  List<OnboardingStep> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  @override
  final String? error;

  @override
  String toString() {
    return 'OnboardingState(isLoading: $isLoading, flow: $flow, currentStep: $currentStep, answers: $answers, history: $history, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.flow, flow) || other.flow == flow) &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      flow,
      currentStep,
      const DeepCollectionEquality().hash(_answers),
      const DeepCollectionEquality().hash(_history),
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      __$$OnboardingStateImplCopyWithImpl<_$OnboardingStateImpl>(
          this, _$identity);
}

abstract class _OnboardingState implements OnboardingState {
  const factory _OnboardingState(
      {final bool isLoading,
      final OnboardingFlow? flow,
      final OnboardingStep? currentStep,
      final Map<String, String> answers,
      final List<OnboardingStep> history,
      final String? error}) = _$OnboardingStateImpl;

  @override
  bool get isLoading;
  @override
  OnboardingFlow? get flow;
  @override
  OnboardingStep? get currentStep;
  @override
  Map<String, String> get answers;
  @override
  List<OnboardingStep> get history;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OnboardingAction {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFlow,
    required TResult Function(String stepId, String optionId) selectOption,
    required TResult Function() continueToNextStep,
    required TResult Function() goBack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFlow,
    TResult? Function(String stepId, String optionId)? selectOption,
    TResult? Function()? continueToNextStep,
    TResult? Function()? goBack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFlow,
    TResult Function(String stepId, String optionId)? selectOption,
    TResult Function()? continueToNextStep,
    TResult Function()? goBack,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFlow value) loadFlow,
    required TResult Function(_SelectOption value) selectOption,
    required TResult Function(_ContinueToNextStep value) continueToNextStep,
    required TResult Function(_GoBack value) goBack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFlow value)? loadFlow,
    TResult? Function(_SelectOption value)? selectOption,
    TResult? Function(_ContinueToNextStep value)? continueToNextStep,
    TResult? Function(_GoBack value)? goBack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFlow value)? loadFlow,
    TResult Function(_SelectOption value)? selectOption,
    TResult Function(_ContinueToNextStep value)? continueToNextStep,
    TResult Function(_GoBack value)? goBack,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingActionCopyWith<$Res> {
  factory $OnboardingActionCopyWith(
          OnboardingAction value, $Res Function(OnboardingAction) then) =
      _$OnboardingActionCopyWithImpl<$Res, OnboardingAction>;
}

/// @nodoc
class _$OnboardingActionCopyWithImpl<$Res, $Val extends OnboardingAction>
    implements $OnboardingActionCopyWith<$Res> {
  _$OnboardingActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadFlowImplCopyWith<$Res> {
  factory _$$LoadFlowImplCopyWith(
          _$LoadFlowImpl value, $Res Function(_$LoadFlowImpl) then) =
      __$$LoadFlowImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadFlowImplCopyWithImpl<$Res>
    extends _$OnboardingActionCopyWithImpl<$Res, _$LoadFlowImpl>
    implements _$$LoadFlowImplCopyWith<$Res> {
  __$$LoadFlowImplCopyWithImpl(
      _$LoadFlowImpl _value, $Res Function(_$LoadFlowImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadFlowImpl implements _LoadFlow {
  const _$LoadFlowImpl();

  @override
  String toString() {
    return 'OnboardingAction.loadFlow()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadFlowImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFlow,
    required TResult Function(String stepId, String optionId) selectOption,
    required TResult Function() continueToNextStep,
    required TResult Function() goBack,
  }) {
    return loadFlow();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFlow,
    TResult? Function(String stepId, String optionId)? selectOption,
    TResult? Function()? continueToNextStep,
    TResult? Function()? goBack,
  }) {
    return loadFlow?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFlow,
    TResult Function(String stepId, String optionId)? selectOption,
    TResult Function()? continueToNextStep,
    TResult Function()? goBack,
    required TResult orElse(),
  }) {
    if (loadFlow != null) {
      return loadFlow();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFlow value) loadFlow,
    required TResult Function(_SelectOption value) selectOption,
    required TResult Function(_ContinueToNextStep value) continueToNextStep,
    required TResult Function(_GoBack value) goBack,
  }) {
    return loadFlow(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFlow value)? loadFlow,
    TResult? Function(_SelectOption value)? selectOption,
    TResult? Function(_ContinueToNextStep value)? continueToNextStep,
    TResult? Function(_GoBack value)? goBack,
  }) {
    return loadFlow?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFlow value)? loadFlow,
    TResult Function(_SelectOption value)? selectOption,
    TResult Function(_ContinueToNextStep value)? continueToNextStep,
    TResult Function(_GoBack value)? goBack,
    required TResult orElse(),
  }) {
    if (loadFlow != null) {
      return loadFlow(this);
    }
    return orElse();
  }
}

abstract class _LoadFlow implements OnboardingAction {
  const factory _LoadFlow() = _$LoadFlowImpl;
}

/// @nodoc
abstract class _$$SelectOptionImplCopyWith<$Res> {
  factory _$$SelectOptionImplCopyWith(
          _$SelectOptionImpl value, $Res Function(_$SelectOptionImpl) then) =
      __$$SelectOptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String stepId, String optionId});
}

/// @nodoc
class __$$SelectOptionImplCopyWithImpl<$Res>
    extends _$OnboardingActionCopyWithImpl<$Res, _$SelectOptionImpl>
    implements _$$SelectOptionImplCopyWith<$Res> {
  __$$SelectOptionImplCopyWithImpl(
      _$SelectOptionImpl _value, $Res Function(_$SelectOptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepId = null,
    Object? optionId = null,
  }) {
    return _then(_$SelectOptionImpl(
      null == stepId
          ? _value.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as String,
      null == optionId
          ? _value.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectOptionImpl implements _SelectOption {
  const _$SelectOptionImpl(this.stepId, this.optionId);

  @override
  final String stepId;
  @override
  final String optionId;

  @override
  String toString() {
    return 'OnboardingAction.selectOption(stepId: $stepId, optionId: $optionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectOptionImpl &&
            (identical(other.stepId, stepId) || other.stepId == stepId) &&
            (identical(other.optionId, optionId) ||
                other.optionId == optionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stepId, optionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectOptionImplCopyWith<_$SelectOptionImpl> get copyWith =>
      __$$SelectOptionImplCopyWithImpl<_$SelectOptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFlow,
    required TResult Function(String stepId, String optionId) selectOption,
    required TResult Function() continueToNextStep,
    required TResult Function() goBack,
  }) {
    return selectOption(stepId, optionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFlow,
    TResult? Function(String stepId, String optionId)? selectOption,
    TResult? Function()? continueToNextStep,
    TResult? Function()? goBack,
  }) {
    return selectOption?.call(stepId, optionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFlow,
    TResult Function(String stepId, String optionId)? selectOption,
    TResult Function()? continueToNextStep,
    TResult Function()? goBack,
    required TResult orElse(),
  }) {
    if (selectOption != null) {
      return selectOption(stepId, optionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFlow value) loadFlow,
    required TResult Function(_SelectOption value) selectOption,
    required TResult Function(_ContinueToNextStep value) continueToNextStep,
    required TResult Function(_GoBack value) goBack,
  }) {
    return selectOption(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFlow value)? loadFlow,
    TResult? Function(_SelectOption value)? selectOption,
    TResult? Function(_ContinueToNextStep value)? continueToNextStep,
    TResult? Function(_GoBack value)? goBack,
  }) {
    return selectOption?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFlow value)? loadFlow,
    TResult Function(_SelectOption value)? selectOption,
    TResult Function(_ContinueToNextStep value)? continueToNextStep,
    TResult Function(_GoBack value)? goBack,
    required TResult orElse(),
  }) {
    if (selectOption != null) {
      return selectOption(this);
    }
    return orElse();
  }
}

abstract class _SelectOption implements OnboardingAction {
  const factory _SelectOption(final String stepId, final String optionId) =
      _$SelectOptionImpl;

  String get stepId;
  String get optionId;
  @JsonKey(ignore: true)
  _$$SelectOptionImplCopyWith<_$SelectOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContinueToNextStepImplCopyWith<$Res> {
  factory _$$ContinueToNextStepImplCopyWith(_$ContinueToNextStepImpl value,
          $Res Function(_$ContinueToNextStepImpl) then) =
      __$$ContinueToNextStepImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ContinueToNextStepImplCopyWithImpl<$Res>
    extends _$OnboardingActionCopyWithImpl<$Res, _$ContinueToNextStepImpl>
    implements _$$ContinueToNextStepImplCopyWith<$Res> {
  __$$ContinueToNextStepImplCopyWithImpl(_$ContinueToNextStepImpl _value,
      $Res Function(_$ContinueToNextStepImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ContinueToNextStepImpl implements _ContinueToNextStep {
  const _$ContinueToNextStepImpl();

  @override
  String toString() {
    return 'OnboardingAction.continueToNextStep()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ContinueToNextStepImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFlow,
    required TResult Function(String stepId, String optionId) selectOption,
    required TResult Function() continueToNextStep,
    required TResult Function() goBack,
  }) {
    return continueToNextStep();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFlow,
    TResult? Function(String stepId, String optionId)? selectOption,
    TResult? Function()? continueToNextStep,
    TResult? Function()? goBack,
  }) {
    return continueToNextStep?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFlow,
    TResult Function(String stepId, String optionId)? selectOption,
    TResult Function()? continueToNextStep,
    TResult Function()? goBack,
    required TResult orElse(),
  }) {
    if (continueToNextStep != null) {
      return continueToNextStep();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFlow value) loadFlow,
    required TResult Function(_SelectOption value) selectOption,
    required TResult Function(_ContinueToNextStep value) continueToNextStep,
    required TResult Function(_GoBack value) goBack,
  }) {
    return continueToNextStep(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFlow value)? loadFlow,
    TResult? Function(_SelectOption value)? selectOption,
    TResult? Function(_ContinueToNextStep value)? continueToNextStep,
    TResult? Function(_GoBack value)? goBack,
  }) {
    return continueToNextStep?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFlow value)? loadFlow,
    TResult Function(_SelectOption value)? selectOption,
    TResult Function(_ContinueToNextStep value)? continueToNextStep,
    TResult Function(_GoBack value)? goBack,
    required TResult orElse(),
  }) {
    if (continueToNextStep != null) {
      return continueToNextStep(this);
    }
    return orElse();
  }
}

abstract class _ContinueToNextStep implements OnboardingAction {
  const factory _ContinueToNextStep() = _$ContinueToNextStepImpl;
}

/// @nodoc
abstract class _$$GoBackImplCopyWith<$Res> {
  factory _$$GoBackImplCopyWith(
          _$GoBackImpl value, $Res Function(_$GoBackImpl) then) =
      __$$GoBackImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoBackImplCopyWithImpl<$Res>
    extends _$OnboardingActionCopyWithImpl<$Res, _$GoBackImpl>
    implements _$$GoBackImplCopyWith<$Res> {
  __$$GoBackImplCopyWithImpl(
      _$GoBackImpl _value, $Res Function(_$GoBackImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GoBackImpl implements _GoBack {
  const _$GoBackImpl();

  @override
  String toString() {
    return 'OnboardingAction.goBack()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoBackImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFlow,
    required TResult Function(String stepId, String optionId) selectOption,
    required TResult Function() continueToNextStep,
    required TResult Function() goBack,
  }) {
    return goBack();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFlow,
    TResult? Function(String stepId, String optionId)? selectOption,
    TResult? Function()? continueToNextStep,
    TResult? Function()? goBack,
  }) {
    return goBack?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFlow,
    TResult Function(String stepId, String optionId)? selectOption,
    TResult Function()? continueToNextStep,
    TResult Function()? goBack,
    required TResult orElse(),
  }) {
    if (goBack != null) {
      return goBack();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFlow value) loadFlow,
    required TResult Function(_SelectOption value) selectOption,
    required TResult Function(_ContinueToNextStep value) continueToNextStep,
    required TResult Function(_GoBack value) goBack,
  }) {
    return goBack(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFlow value)? loadFlow,
    TResult? Function(_SelectOption value)? selectOption,
    TResult? Function(_ContinueToNextStep value)? continueToNextStep,
    TResult? Function(_GoBack value)? goBack,
  }) {
    return goBack?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFlow value)? loadFlow,
    TResult Function(_SelectOption value)? selectOption,
    TResult Function(_ContinueToNextStep value)? continueToNextStep,
    TResult Function(_GoBack value)? goBack,
    required TResult orElse(),
  }) {
    if (goBack != null) {
      return goBack(this);
    }
    return orElse();
  }
}

abstract class _GoBack implements OnboardingAction {
  const factory _GoBack() = _$GoBackImpl;
}
