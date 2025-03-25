import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:vanilla_state/vanilla_state.dart';

class MultiInheritedVanilla extends StatelessWidget {
  final List<InheritedVanilla> children;
  final Widget? child;

  const MultiInheritedVanilla({
    Key? key,
    required this.children,
    this.child,
  })  : assert(children != const [], 'children field must not be empty'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Nested(
      children: children,
      child: child,
    );
  }
}
