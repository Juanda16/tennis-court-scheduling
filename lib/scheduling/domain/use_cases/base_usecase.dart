abstract class BaseUseCase<I, R> {
  /// Method to be executed by current use case.
  ///
  /// Should be the only public method
  R call(I data);
}
