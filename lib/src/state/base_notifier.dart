import 'package:vanilla_state/src/vanilla.dart';

part 'states.dart';

/// short hand for defining a data VanillaNotifier class with loading, message and success
/// states
class BaseNotifier<T> = VanillaNotifier<BaseState<T>>
    with VanillaNotifierUtilsMixin<T>;

/// Util mixins that make it easier and quicker to value =  initial, loading,
/// message and success states
mixin VanillaNotifierUtilsMixin<T> on VanillaNotifier<BaseState<T>> {
  T? get data => state.data;

  void setState(BaseState<T> state) {
    value = state;
  }

  void setError(String message, [T? data]) {
    if (isDisposed) return;
    value = ErrorState(message: message, data: data ?? state.data);
  }

  void setInLoading({T? data, bool nullifyError = true}) {
    if (isDisposed) return;
    value = InLoadingState(data: data ?? state.data);
  }

  void setOutLoading({T? data, bool nullifyError = true}) {
    if (isDisposed) return;
    value = OutLoadingState(data: data ?? state.data);
  }

  void setSuccess([T? data]) {
    if (isDisposed) return;
    value = SuccessState(data: data);
  }

  void setData(T? data) {
    if (isDisposed) return;
    value = state.copyWith(data: data);
  }

  /// this sets data to a non-special state ie: initial
  void setInitial(T? data, {bool nullifyData = false}) {
    if (isDisposed) return;
    value = InitialState(data: data);
  }
}
