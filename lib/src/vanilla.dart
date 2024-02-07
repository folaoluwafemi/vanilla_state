import 'dart:async';

import 'package:flutter/widgets.dart';

part 'ioc/vanilla_holder.dart';

part 'utils/extension.dart';

/// [VanillaNotifier] extends flutter's [ValueNotifier] but exposes extra methods like [stream] and [state]
///
/// It is open to extend, mixin, implement and instantiate as you please.
///
/// If you will instantiate it, do not forget to call [dispose]
class VanillaNotifier<State> extends ValueNotifier<State> {
  VanillaNotifier(super.value) {
    addListener(_streamListener);
  }

  void _streamListener() {
    _streamController.add(value);
  }

  Stream<State> get stream => _streamController.stream;

  final StreamController<State> _streamController = StreamController<State>();

  bool get isDisposed => _streamController.isClosed;

  State get state => value;

  set state(State state) {
    if (value == state) return;
    value = state;
  }

  @override
  void dispose() {
    print('disposed');
    removeListener(_streamListener);
    _streamController.close();
    super.dispose();
  }
}
