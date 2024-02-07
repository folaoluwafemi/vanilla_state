part of '../vanilla.dart';

/// Widget that holds a [VanillaNotifier]
///
/// Access to [VanillaNotifier] by context is scope based and as such you should place it in
/// the appropriate scope in your widget tree.
final class InheritedVanilla<Notifier extends VanillaNotifier>
    extends InheritedWidget {
  final Notifier Function() createNotifier;
  final bool shouldDispose;

  const InheritedVanilla({
    required this.createNotifier,
    this.shouldDispose = true,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  @override
  InheritedVanillaElement createElement() => InheritedVanillaElement<Notifier>(
        this,
        notifier: createNotifier(),
        shouldDispose: shouldDispose,
      );
}

class InheritedVanillaElement<Notifier extends VanillaNotifier>
    extends InheritedElement {
  final Notifier notifier;
  final bool shouldDispose;

  @override
  void unmount() {
    if (shouldDispose) notifier.dispose();
    super.unmount();
  }

  InheritedVanillaElement(
    super.widget, {
    required this.notifier,
    required this.shouldDispose,
  });
}
