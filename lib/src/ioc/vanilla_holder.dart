part of '../vanilla.dart';

/// Widget that holds a [VanillaNotifier]
///
/// Access to [VanillaNotifier] by context is scope based and as such you should place it in
/// the appropriate scope in your widget tree.
class InheritedVanilla<Notifier extends VanillaNotifier>
    extends SingleChildStatelessWidget {
  final Notifier Function() createNotifier;
  final bool shouldDispose;
  final bool isLazy;
  final Widget? child;

  const InheritedVanilla({
    required this.createNotifier,
    this.shouldDispose = true,
    this.isLazy = true,
    this.child,
    Key? key,
  }) : super(key: key);

  static Notifier of<Notifier extends VanillaNotifier>(BuildContext context) {
    return context.read<Notifier>();
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return _InheritedVanilla(
      createNotifier: createNotifier,
      shouldDispose: shouldDispose,
      isLazy: isLazy,
      child: (child ?? this.child)!,
    );
  }
}

final class _InheritedVanilla<Notifier extends VanillaNotifier>
    extends InheritedWidget {
  final Notifier Function() createNotifier;
  final bool shouldDispose;
  final bool isLazy;

  const _InheritedVanilla({
    required this.createNotifier,
    this.shouldDispose = true,
    this.isLazy = true,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  @override
  _InheritedVanillaElement createElement() =>
      _InheritedVanillaElement<Notifier>(
        this,
        isLazy: isLazy,
        createNotifier: createNotifier,
        shouldDispose: shouldDispose,
      );
}

class _InheritedVanillaElement<Notifier extends VanillaNotifier>
    extends InheritedElement {
  final Notifier Function() createNotifier;
  final bool shouldDispose;
  final bool isLazy;

  _InheritedVanillaElement(
    super.widget, {
    required this.createNotifier,
    required this.shouldDispose,
    required this.isLazy,
  }) {
    if (!isLazy) notifier;
  }

  late final Notifier _notifier = createNotifier();

  Notifier get notifier => _notifier;

  @override
  void unmount() {
    if (shouldDispose) notifier.dispose();
    super.unmount();
  }
}
