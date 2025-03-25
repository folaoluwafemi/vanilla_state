part of 'base_notifier.dart';

/// class to be extended for cubit states that have data
///
/// see more:
///   [BaseCubit]
sealed class BaseState<T> {
  final T? data;

  const BaseState({
    this.data,
  });

  bool get hasData => data != null;

  bool get isSuccess => this is SuccessState<T>;

  bool get isInLoading => this is InLoadingState<T>;

  bool get isOutLoading => this is OutLoadingState<T>;

  bool get isError => this is ErrorState<T>;

  BaseState<T> copyWith({
    T? data,
    bool nullifyData = false,
  });
}

final class InitialState<T> extends BaseState<T> {
  const InitialState({
    super.data,
  });

  @override
  InitialState<T> copyWith({
    T? data,
    bool nullifyData = false,
  }) {
    return InitialState(
      data: nullifyData ? null : data ?? this.data,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseState &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;
}

final class OutLoadingState<T> extends BaseState<T> {
  const OutLoadingState({
    super.data,
  });

  @override
  OutLoadingState<T> copyWith({
    T? data,
    bool nullifyData = false,
  }) {
    return OutLoadingState(
      data: nullifyData ? null : data ?? this.data,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseState &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;
}

final class InLoadingState<T> extends BaseState<T> {
  const InLoadingState({
    super.data,
  });

  @override
  InLoadingState<T> copyWith({
    T? data,
    bool nullifyData = false,
  }) {
    return InLoadingState(
      data: nullifyData ? null : data ?? this.data,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseState &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;
}

final class SuccessState<T> extends BaseState<T> {
  const SuccessState({
    super.data,
  });

  @override
  SuccessState<T> copyWith({
    T? data,
    bool nullifyData = false,
  }) {
    return SuccessState(
      data: nullifyData ? null : data ?? this.data,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseState &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;
}

final class ErrorState<T> extends BaseState<T> {
  final String message;

  const ErrorState({
    super.data,
    required this.message,
  });

  @override
  ErrorState<T> copyWith({
    T? data,
    String? message,
    bool nullifyData = false,
  }) {
    return ErrorState(
      data: nullifyData ? null : data ?? this.data,
      message: message ?? this.message,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseState &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;
}

typedef RetryCallback = Future<dynamic> Function();

final class FatalErrorState<T> extends BaseState<T> {
  final String message;
  final RetryCallback? retryCallback;

  const FatalErrorState({
    super.data,
    required this.message,
    this.retryCallback,
  });

  @override
  FatalErrorState<T> copyWith({
    T? data,
    String? message,
    RetryCallback? retryCallback,
    bool nullifyData = false,
  }) {
    return FatalErrorState(
      data: nullifyData ? null : data ?? this.data,
      message: message ?? this.message,
      retryCallback: retryCallback ?? this.retryCallback,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseState &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;
}
