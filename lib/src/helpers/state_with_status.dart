import 'package:vanilla_state/src/helpers/equality_checker.dart';

abstract base class StateWithStatus with EqualityChecker {
  final bool success;
  final bool loading;
  final Exception? error;

  const StateWithStatus({
    required this.success,
    required this.loading,
    this.error,
  });

  dynamic copyWith({
    bool? success,
    bool? loading,
    Exception? error,
  });
}
