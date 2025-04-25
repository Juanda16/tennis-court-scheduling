class NoParam {
  static const NoParam _instance = NoParam._();

  /// Returns the only [NoParam] instance that can be created.
  static NoParam get i => _instance;

  const NoParam._();
}
