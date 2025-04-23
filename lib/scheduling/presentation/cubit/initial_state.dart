part of 'initial_cubit.dart';

@freezed
class InitialState with _$InitialState {
  const factory InitialState.initial() = InitialInitial;
  const factory InitialState.loading() = InitialLoading;
  const factory InitialState.loaded() = InitialLoaded;

  const factory InitialState.error({
    required String message,
    required bool error,
  }) = InitialError;
}
