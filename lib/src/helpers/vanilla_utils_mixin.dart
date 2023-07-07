import 'package:vanilla_state/src/helpers/state_with_status.dart';
import 'package:vanilla_state/src/vanilla.dart';

mixin VanillaUtilsMixin<State extends StateWithStatus>
    on VanillaNotifier<State> {
  void notifyOnError(Exception error) {
    state = state.copyWith(error: error, loading: false, success: false);
  }

  void notifyLoading({
    nullifyError = true,
    State? state_,
  }) {
    if (state.loading) return;
    state = (state_ ?? state).copyWith(
      loading: true,
      success: false,
      error: nullifyError ? null : state.error,
    );
  }

  void notifySuccess({
    State? state,
    nullifyError = true,
  }) {
    this.state = (state ?? this.state).copyWith(
      success: true,
      loading: false,
      error: nullifyError ? null : (state ?? this.state).error,
    );
  }
}
