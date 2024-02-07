part of '../vanilla.dart';

/// Widget that holds a [VanillaNotifier]
///
/// Access to [VanillaNotifier] by context is scope based and as such you should place it in
/// the appropriate scope in your widget tree.
final class InheritedVanilla<Notifier extends VanillaNotifier>
    extends InheritedWidget {
  final Notifier Function() createNotifier;

  const InheritedVanilla({
    required this.createNotifier,
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
        createNotifier(),
      );
}

class InheritedVanillaElement<Notifier extends VanillaNotifier>
    extends InheritedElement {
  final Notifier notifier;

  @override
  void unmount() {
    notifier.dispose();
    super.unmount();
  }

  InheritedVanillaElement(super.widget, this.notifier);
}
