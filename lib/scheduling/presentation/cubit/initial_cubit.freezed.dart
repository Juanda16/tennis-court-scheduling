// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'initial_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InitialState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InitialState()';
  }
}

/// @nodoc
class $InitialStateCopyWith<$Res> {
  $InitialStateCopyWith(InitialState _, $Res Function(InitialState) __);
}

/// @nodoc

class InitialInitial implements InitialState {
  const InitialInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InitialInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InitialState.initial()';
  }
}

/// @nodoc

class InitialLoading implements InitialState {
  const InitialLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InitialLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InitialState.loading()';
  }
}

/// @nodoc

class InitialLoaded implements InitialState {
  const InitialLoaded();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InitialLoaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InitialState.loaded()';
  }
}

/// @nodoc

class InitialError implements InitialState {
  const InitialError({required this.message, required this.error});

  final String message;
  final bool error;

  /// Create a copy of InitialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InitialErrorCopyWith<InitialError> get copyWith =>
      _$InitialErrorCopyWithImpl<InitialError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InitialError &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, error);

  @override
  String toString() {
    return 'InitialState.error(message: $message, error: $error)';
  }
}

/// @nodoc
abstract mixin class $InitialErrorCopyWith<$Res>
    implements $InitialStateCopyWith<$Res> {
  factory $InitialErrorCopyWith(
          InitialError value, $Res Function(InitialError) _then) =
      _$InitialErrorCopyWithImpl;
  @useResult
  $Res call({String message, bool error});
}

/// @nodoc
class _$InitialErrorCopyWithImpl<$Res> implements $InitialErrorCopyWith<$Res> {
  _$InitialErrorCopyWithImpl(this._self, this._then);

  final InitialError _self;
  final $Res Function(InitialError) _then;

  /// Create a copy of InitialState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? error = null,
  }) {
    return _then(InitialError(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
