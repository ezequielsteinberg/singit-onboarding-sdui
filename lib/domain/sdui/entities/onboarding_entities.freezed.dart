// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OnboardingResponse {
  String get message => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  OnboardingFlow get onboardingFlow => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnboardingResponseCopyWith<OnboardingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingResponseCopyWith<$Res> {
  factory $OnboardingResponseCopyWith(
          OnboardingResponse value, $Res Function(OnboardingResponse) then) =
      _$OnboardingResponseCopyWithImpl<$Res, OnboardingResponse>;
  @useResult
  $Res call({String message, String status, OnboardingFlow onboardingFlow});

  $OnboardingFlowCopyWith<$Res> get onboardingFlow;
}

/// @nodoc
class _$OnboardingResponseCopyWithImpl<$Res, $Val extends OnboardingResponse>
    implements $OnboardingResponseCopyWith<$Res> {
  _$OnboardingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? status = null,
    Object? onboardingFlow = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      onboardingFlow: null == onboardingFlow
          ? _value.onboardingFlow
          : onboardingFlow // ignore: cast_nullable_to_non_nullable
              as OnboardingFlow,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OnboardingFlowCopyWith<$Res> get onboardingFlow {
    return $OnboardingFlowCopyWith<$Res>(_value.onboardingFlow, (value) {
      return _then(_value.copyWith(onboardingFlow: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OnboardingResponseImplCopyWith<$Res>
    implements $OnboardingResponseCopyWith<$Res> {
  factory _$$OnboardingResponseImplCopyWith(_$OnboardingResponseImpl value,
          $Res Function(_$OnboardingResponseImpl) then) =
      __$$OnboardingResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String status, OnboardingFlow onboardingFlow});

  @override
  $OnboardingFlowCopyWith<$Res> get onboardingFlow;
}

/// @nodoc
class __$$OnboardingResponseImplCopyWithImpl<$Res>
    extends _$OnboardingResponseCopyWithImpl<$Res, _$OnboardingResponseImpl>
    implements _$$OnboardingResponseImplCopyWith<$Res> {
  __$$OnboardingResponseImplCopyWithImpl(_$OnboardingResponseImpl _value,
      $Res Function(_$OnboardingResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? status = null,
    Object? onboardingFlow = null,
  }) {
    return _then(_$OnboardingResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      onboardingFlow: null == onboardingFlow
          ? _value.onboardingFlow
          : onboardingFlow // ignore: cast_nullable_to_non_nullable
              as OnboardingFlow,
    ));
  }
}

/// @nodoc

class _$OnboardingResponseImpl implements _OnboardingResponse {
  const _$OnboardingResponseImpl(
      {required this.message,
      required this.status,
      required this.onboardingFlow});

  @override
  final String message;
  @override
  final String status;
  @override
  final OnboardingFlow onboardingFlow;

  @override
  String toString() {
    return 'OnboardingResponse(message: $message, status: $status, onboardingFlow: $onboardingFlow)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.onboardingFlow, onboardingFlow) ||
                other.onboardingFlow == onboardingFlow));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, status, onboardingFlow);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingResponseImplCopyWith<_$OnboardingResponseImpl> get copyWith =>
      __$$OnboardingResponseImplCopyWithImpl<_$OnboardingResponseImpl>(
          this, _$identity);
}

abstract class _OnboardingResponse implements OnboardingResponse {
  const factory _OnboardingResponse(
      {required final String message,
      required final String status,
      required final OnboardingFlow onboardingFlow}) = _$OnboardingResponseImpl;

  @override
  String get message;
  @override
  String get status;
  @override
  OnboardingFlow get onboardingFlow;
  @override
  @JsonKey(ignore: true)
  _$$OnboardingResponseImplCopyWith<_$OnboardingResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OnboardingFlow {
  List<OnboardingStep> get steps => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnboardingFlowCopyWith<OnboardingFlow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingFlowCopyWith<$Res> {
  factory $OnboardingFlowCopyWith(
          OnboardingFlow value, $Res Function(OnboardingFlow) then) =
      _$OnboardingFlowCopyWithImpl<$Res, OnboardingFlow>;
  @useResult
  $Res call({List<OnboardingStep> steps});
}

/// @nodoc
class _$OnboardingFlowCopyWithImpl<$Res, $Val extends OnboardingFlow>
    implements $OnboardingFlowCopyWith<$Res> {
  _$OnboardingFlowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = null,
  }) {
    return _then(_value.copyWith(
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<OnboardingStep>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnboardingFlowImplCopyWith<$Res>
    implements $OnboardingFlowCopyWith<$Res> {
  factory _$$OnboardingFlowImplCopyWith(_$OnboardingFlowImpl value,
          $Res Function(_$OnboardingFlowImpl) then) =
      __$$OnboardingFlowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<OnboardingStep> steps});
}

/// @nodoc
class __$$OnboardingFlowImplCopyWithImpl<$Res>
    extends _$OnboardingFlowCopyWithImpl<$Res, _$OnboardingFlowImpl>
    implements _$$OnboardingFlowImplCopyWith<$Res> {
  __$$OnboardingFlowImplCopyWithImpl(
      _$OnboardingFlowImpl _value, $Res Function(_$OnboardingFlowImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = null,
  }) {
    return _then(_$OnboardingFlowImpl(
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<OnboardingStep>,
    ));
  }
}

/// @nodoc

class _$OnboardingFlowImpl implements _OnboardingFlow {
  const _$OnboardingFlowImpl({required final List<OnboardingStep> steps})
      : _steps = steps;

  final List<OnboardingStep> _steps;
  @override
  List<OnboardingStep> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  String toString() {
    return 'OnboardingFlow(steps: $steps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingFlowImpl &&
            const DeepCollectionEquality().equals(other._steps, _steps));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_steps));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingFlowImplCopyWith<_$OnboardingFlowImpl> get copyWith =>
      __$$OnboardingFlowImplCopyWithImpl<_$OnboardingFlowImpl>(
          this, _$identity);
}

abstract class _OnboardingFlow implements OnboardingFlow {
  const factory _OnboardingFlow({required final List<OnboardingStep> steps}) =
      _$OnboardingFlowImpl;

  @override
  List<OnboardingStep> get steps;
  @override
  @JsonKey(ignore: true)
  _$$OnboardingFlowImplCopyWith<_$OnboardingFlowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OnboardingStep {
  String get id => throw _privateConstructorUsedError;
  int get stepIndex => throw _privateConstructorUsedError;
  String get stepType => throw _privateConstructorUsedError;
  String get componentType => throw _privateConstructorUsedError;
  Map<String, dynamic> get content => throw _privateConstructorUsedError;
  Map<String, String>? get assets => throw _privateConstructorUsedError;
  List<StepOption>? get options => throw _privateConstructorUsedError;
  List<NextStepRule>? get nextSteps => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnboardingStepCopyWith<OnboardingStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStepCopyWith<$Res> {
  factory $OnboardingStepCopyWith(
          OnboardingStep value, $Res Function(OnboardingStep) then) =
      _$OnboardingStepCopyWithImpl<$Res, OnboardingStep>;
  @useResult
  $Res call(
      {String id,
      int stepIndex,
      String stepType,
      String componentType,
      Map<String, dynamic> content,
      Map<String, String>? assets,
      List<StepOption>? options,
      List<NextStepRule>? nextSteps});
}

/// @nodoc
class _$OnboardingStepCopyWithImpl<$Res, $Val extends OnboardingStep>
    implements $OnboardingStepCopyWith<$Res> {
  _$OnboardingStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stepIndex = null,
    Object? stepType = null,
    Object? componentType = null,
    Object? content = null,
    Object? assets = freezed,
    Object? options = freezed,
    Object? nextSteps = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stepIndex: null == stepIndex
          ? _value.stepIndex
          : stepIndex // ignore: cast_nullable_to_non_nullable
              as int,
      stepType: null == stepType
          ? _value.stepType
          : stepType // ignore: cast_nullable_to_non_nullable
              as String,
      componentType: null == componentType
          ? _value.componentType
          : componentType // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      assets: freezed == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<StepOption>?,
      nextSteps: freezed == nextSteps
          ? _value.nextSteps
          : nextSteps // ignore: cast_nullable_to_non_nullable
              as List<NextStepRule>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnboardingStepImplCopyWith<$Res>
    implements $OnboardingStepCopyWith<$Res> {
  factory _$$OnboardingStepImplCopyWith(_$OnboardingStepImpl value,
          $Res Function(_$OnboardingStepImpl) then) =
      __$$OnboardingStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int stepIndex,
      String stepType,
      String componentType,
      Map<String, dynamic> content,
      Map<String, String>? assets,
      List<StepOption>? options,
      List<NextStepRule>? nextSteps});
}

/// @nodoc
class __$$OnboardingStepImplCopyWithImpl<$Res>
    extends _$OnboardingStepCopyWithImpl<$Res, _$OnboardingStepImpl>
    implements _$$OnboardingStepImplCopyWith<$Res> {
  __$$OnboardingStepImplCopyWithImpl(
      _$OnboardingStepImpl _value, $Res Function(_$OnboardingStepImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stepIndex = null,
    Object? stepType = null,
    Object? componentType = null,
    Object? content = null,
    Object? assets = freezed,
    Object? options = freezed,
    Object? nextSteps = freezed,
  }) {
    return _then(_$OnboardingStepImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stepIndex: null == stepIndex
          ? _value.stepIndex
          : stepIndex // ignore: cast_nullable_to_non_nullable
              as int,
      stepType: null == stepType
          ? _value.stepType
          : stepType // ignore: cast_nullable_to_non_nullable
              as String,
      componentType: null == componentType
          ? _value.componentType
          : componentType // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      assets: freezed == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      options: freezed == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<StepOption>?,
      nextSteps: freezed == nextSteps
          ? _value._nextSteps
          : nextSteps // ignore: cast_nullable_to_non_nullable
              as List<NextStepRule>?,
    ));
  }
}

/// @nodoc

class _$OnboardingStepImpl implements _OnboardingStep {
  const _$OnboardingStepImpl(
      {required this.id,
      required this.stepIndex,
      required this.stepType,
      required this.componentType,
      required final Map<String, dynamic> content,
      final Map<String, String>? assets,
      final List<StepOption>? options,
      final List<NextStepRule>? nextSteps})
      : _content = content,
        _assets = assets,
        _options = options,
        _nextSteps = nextSteps;

  @override
  final String id;
  @override
  final int stepIndex;
  @override
  final String stepType;
  @override
  final String componentType;
  final Map<String, dynamic> _content;
  @override
  Map<String, dynamic> get content {
    if (_content is EqualUnmodifiableMapView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_content);
  }

  final Map<String, String>? _assets;
  @override
  Map<String, String>? get assets {
    final value = _assets;
    if (value == null) return null;
    if (_assets is EqualUnmodifiableMapView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<StepOption>? _options;
  @override
  List<StepOption>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<NextStepRule>? _nextSteps;
  @override
  List<NextStepRule>? get nextSteps {
    final value = _nextSteps;
    if (value == null) return null;
    if (_nextSteps is EqualUnmodifiableListView) return _nextSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OnboardingStep(id: $id, stepIndex: $stepIndex, stepType: $stepType, componentType: $componentType, content: $content, assets: $assets, options: $options, nextSteps: $nextSteps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingStepImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stepIndex, stepIndex) ||
                other.stepIndex == stepIndex) &&
            (identical(other.stepType, stepType) ||
                other.stepType == stepType) &&
            (identical(other.componentType, componentType) ||
                other.componentType == componentType) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            const DeepCollectionEquality().equals(other._assets, _assets) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            const DeepCollectionEquality()
                .equals(other._nextSteps, _nextSteps));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      stepIndex,
      stepType,
      componentType,
      const DeepCollectionEquality().hash(_content),
      const DeepCollectionEquality().hash(_assets),
      const DeepCollectionEquality().hash(_options),
      const DeepCollectionEquality().hash(_nextSteps));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingStepImplCopyWith<_$OnboardingStepImpl> get copyWith =>
      __$$OnboardingStepImplCopyWithImpl<_$OnboardingStepImpl>(
          this, _$identity);
}

abstract class _OnboardingStep implements OnboardingStep {
  const factory _OnboardingStep(
      {required final String id,
      required final int stepIndex,
      required final String stepType,
      required final String componentType,
      required final Map<String, dynamic> content,
      final Map<String, String>? assets,
      final List<StepOption>? options,
      final List<NextStepRule>? nextSteps}) = _$OnboardingStepImpl;

  @override
  String get id;
  @override
  int get stepIndex;
  @override
  String get stepType;
  @override
  String get componentType;
  @override
  Map<String, dynamic> get content;
  @override
  Map<String, String>? get assets;
  @override
  List<StepOption>? get options;
  @override
  List<NextStepRule>? get nextSteps;
  @override
  @JsonKey(ignore: true)
  _$$OnboardingStepImplCopyWith<_$OnboardingStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StepOption {
  String get id => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String? get imgUrl => throw _privateConstructorUsedError;
  Map<String, dynamic> get translations => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StepOptionCopyWith<StepOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepOptionCopyWith<$Res> {
  factory $StepOptionCopyWith(
          StepOption value, $Res Function(StepOption) then) =
      _$StepOptionCopyWithImpl<$Res, StepOption>;
  @useResult
  $Res call(
      {String id,
      String value,
      String? imgUrl,
      Map<String, dynamic> translations});
}

/// @nodoc
class _$StepOptionCopyWithImpl<$Res, $Val extends StepOption>
    implements $StepOptionCopyWith<$Res> {
  _$StepOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? value = null,
    Object? imgUrl = freezed,
    Object? translations = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      translations: null == translations
          ? _value.translations
          : translations // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StepOptionImplCopyWith<$Res>
    implements $StepOptionCopyWith<$Res> {
  factory _$$StepOptionImplCopyWith(
          _$StepOptionImpl value, $Res Function(_$StepOptionImpl) then) =
      __$$StepOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String value,
      String? imgUrl,
      Map<String, dynamic> translations});
}

/// @nodoc
class __$$StepOptionImplCopyWithImpl<$Res>
    extends _$StepOptionCopyWithImpl<$Res, _$StepOptionImpl>
    implements _$$StepOptionImplCopyWith<$Res> {
  __$$StepOptionImplCopyWithImpl(
      _$StepOptionImpl _value, $Res Function(_$StepOptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? value = null,
    Object? imgUrl = freezed,
    Object? translations = null,
  }) {
    return _then(_$StepOptionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      translations: null == translations
          ? _value._translations
          : translations // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$StepOptionImpl implements _StepOption {
  const _$StepOptionImpl(
      {required this.id,
      required this.value,
      this.imgUrl,
      required final Map<String, dynamic> translations})
      : _translations = translations;

  @override
  final String id;
  @override
  final String value;
  @override
  final String? imgUrl;
  final Map<String, dynamic> _translations;
  @override
  Map<String, dynamic> get translations {
    if (_translations is EqualUnmodifiableMapView) return _translations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_translations);
  }

  @override
  String toString() {
    return 'StepOption(id: $id, value: $value, imgUrl: $imgUrl, translations: $translations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepOptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            const DeepCollectionEquality()
                .equals(other._translations, _translations));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, value, imgUrl,
      const DeepCollectionEquality().hash(_translations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StepOptionImplCopyWith<_$StepOptionImpl> get copyWith =>
      __$$StepOptionImplCopyWithImpl<_$StepOptionImpl>(this, _$identity);
}

abstract class _StepOption implements StepOption {
  const factory _StepOption(
      {required final String id,
      required final String value,
      final String? imgUrl,
      required final Map<String, dynamic> translations}) = _$StepOptionImpl;

  @override
  String get id;
  @override
  String get value;
  @override
  String? get imgUrl;
  @override
  Map<String, dynamic> get translations;
  @override
  @JsonKey(ignore: true)
  _$$StepOptionImplCopyWith<_$StepOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NextStepRule {
  String get nextStepId => throw _privateConstructorUsedError;
  List<RuleCondition> get conditions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NextStepRuleCopyWith<NextStepRule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NextStepRuleCopyWith<$Res> {
  factory $NextStepRuleCopyWith(
          NextStepRule value, $Res Function(NextStepRule) then) =
      _$NextStepRuleCopyWithImpl<$Res, NextStepRule>;
  @useResult
  $Res call({String nextStepId, List<RuleCondition> conditions});
}

/// @nodoc
class _$NextStepRuleCopyWithImpl<$Res, $Val extends NextStepRule>
    implements $NextStepRuleCopyWith<$Res> {
  _$NextStepRuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextStepId = null,
    Object? conditions = null,
  }) {
    return _then(_value.copyWith(
      nextStepId: null == nextStepId
          ? _value.nextStepId
          : nextStepId // ignore: cast_nullable_to_non_nullable
              as String,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as List<RuleCondition>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NextStepRuleImplCopyWith<$Res>
    implements $NextStepRuleCopyWith<$Res> {
  factory _$$NextStepRuleImplCopyWith(
          _$NextStepRuleImpl value, $Res Function(_$NextStepRuleImpl) then) =
      __$$NextStepRuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nextStepId, List<RuleCondition> conditions});
}

/// @nodoc
class __$$NextStepRuleImplCopyWithImpl<$Res>
    extends _$NextStepRuleCopyWithImpl<$Res, _$NextStepRuleImpl>
    implements _$$NextStepRuleImplCopyWith<$Res> {
  __$$NextStepRuleImplCopyWithImpl(
      _$NextStepRuleImpl _value, $Res Function(_$NextStepRuleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextStepId = null,
    Object? conditions = null,
  }) {
    return _then(_$NextStepRuleImpl(
      nextStepId: null == nextStepId
          ? _value.nextStepId
          : nextStepId // ignore: cast_nullable_to_non_nullable
              as String,
      conditions: null == conditions
          ? _value._conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as List<RuleCondition>,
    ));
  }
}

/// @nodoc

class _$NextStepRuleImpl implements _NextStepRule {
  const _$NextStepRuleImpl(
      {required this.nextStepId, required final List<RuleCondition> conditions})
      : _conditions = conditions;

  @override
  final String nextStepId;
  final List<RuleCondition> _conditions;
  @override
  List<RuleCondition> get conditions {
    if (_conditions is EqualUnmodifiableListView) return _conditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conditions);
  }

  @override
  String toString() {
    return 'NextStepRule(nextStepId: $nextStepId, conditions: $conditions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NextStepRuleImpl &&
            (identical(other.nextStepId, nextStepId) ||
                other.nextStepId == nextStepId) &&
            const DeepCollectionEquality()
                .equals(other._conditions, _conditions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nextStepId,
      const DeepCollectionEquality().hash(_conditions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NextStepRuleImplCopyWith<_$NextStepRuleImpl> get copyWith =>
      __$$NextStepRuleImplCopyWithImpl<_$NextStepRuleImpl>(this, _$identity);
}

abstract class _NextStepRule implements NextStepRule {
  const factory _NextStepRule(
      {required final String nextStepId,
      required final List<RuleCondition> conditions}) = _$NextStepRuleImpl;

  @override
  String get nextStepId;
  @override
  List<RuleCondition> get conditions;
  @override
  @JsonKey(ignore: true)
  _$$NextStepRuleImplCopyWith<_$NextStepRuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RuleCondition {
  String get stepId => throw _privateConstructorUsedError;
  String get optionId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RuleConditionCopyWith<RuleCondition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RuleConditionCopyWith<$Res> {
  factory $RuleConditionCopyWith(
          RuleCondition value, $Res Function(RuleCondition) then) =
      _$RuleConditionCopyWithImpl<$Res, RuleCondition>;
  @useResult
  $Res call({String stepId, String optionId});
}

/// @nodoc
class _$RuleConditionCopyWithImpl<$Res, $Val extends RuleCondition>
    implements $RuleConditionCopyWith<$Res> {
  _$RuleConditionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepId = null,
    Object? optionId = null,
  }) {
    return _then(_value.copyWith(
      stepId: null == stepId
          ? _value.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as String,
      optionId: null == optionId
          ? _value.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RuleConditionImplCopyWith<$Res>
    implements $RuleConditionCopyWith<$Res> {
  factory _$$RuleConditionImplCopyWith(
          _$RuleConditionImpl value, $Res Function(_$RuleConditionImpl) then) =
      __$$RuleConditionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String stepId, String optionId});
}

/// @nodoc
class __$$RuleConditionImplCopyWithImpl<$Res>
    extends _$RuleConditionCopyWithImpl<$Res, _$RuleConditionImpl>
    implements _$$RuleConditionImplCopyWith<$Res> {
  __$$RuleConditionImplCopyWithImpl(
      _$RuleConditionImpl _value, $Res Function(_$RuleConditionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepId = null,
    Object? optionId = null,
  }) {
    return _then(_$RuleConditionImpl(
      stepId: null == stepId
          ? _value.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as String,
      optionId: null == optionId
          ? _value.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RuleConditionImpl implements _RuleCondition {
  const _$RuleConditionImpl({required this.stepId, required this.optionId});

  @override
  final String stepId;
  @override
  final String optionId;

  @override
  String toString() {
    return 'RuleCondition(stepId: $stepId, optionId: $optionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleConditionImpl &&
            (identical(other.stepId, stepId) || other.stepId == stepId) &&
            (identical(other.optionId, optionId) ||
                other.optionId == optionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stepId, optionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RuleConditionImplCopyWith<_$RuleConditionImpl> get copyWith =>
      __$$RuleConditionImplCopyWithImpl<_$RuleConditionImpl>(this, _$identity);
}

abstract class _RuleCondition implements RuleCondition {
  const factory _RuleCondition(
      {required final String stepId,
      required final String optionId}) = _$RuleConditionImpl;

  @override
  String get stepId;
  @override
  String get optionId;
  @override
  @JsonKey(ignore: true)
  _$$RuleConditionImplCopyWith<_$RuleConditionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
