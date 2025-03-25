part of '../vanilla.dart';

extension VanillaBuildContextExtension on BuildContext {
  /// Get the [VanillaNotifier] of type [T] from the nearest ancestor
  ///
  /// This method does NOT trigger a rebuild
  T read<T extends VanillaNotifier>() {
    try {
      return (getElementForInheritedWidgetOfExactType<_InheritedVanilla<T>>()
              as _InheritedVanillaElement<T>?)!
          .notifier;
    } catch (e) {
      throw Exception('Cannot find InheritedVanilla<$T> in the element tree');
    }
  }
}
