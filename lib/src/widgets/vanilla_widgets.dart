import 'package:vanilla_state/src/vanilla.dart';
import 'package:flutter/material.dart';

part 'vanilla_builder.dart';

part 'vanilla_listener.dart';

typedef VanillaWidgetBuilder<T> = Widget Function(
  BuildContext context,
  T state,
);

typedef VanillaListenerCallback<T> = void Function(
  T? previous,
  T current,
);

typedef VanillaSelectorCallback<T> = bool Function(
  T? previous,
  T current,
);
