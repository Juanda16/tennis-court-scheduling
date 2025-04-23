import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'initial_cubit.freezed.dart';
part 'initial_state.dart';

class InitialCubit extends Cubit<InitialState> {
  InitialCubit()
      : super(
          const InitialState.initial(),
        );

  Future<void> loadData() async {
    try {
      emit(const InitialState.loading());
      emit(const InitialState.loaded());
    } catch (e) {
      emit(InitialState.error(
          error: true,
          message: 'Failed to load portfolio data: ${e.toString()}'));
    }
  }
}
