mixin EqualityChecker {
  List<Object?> get props;

  @override
  int get hashCode {
    return props
        .fold<int>(
          0,
          (previousValue, element) => previousValue ^ element.hashCode,
        )
        .hashCode;
  }

  @override
  bool operator ==(Object other) {
    if (other is! EqualityChecker) return false;
    return props.every(
      (element) => element == other.props[props.indexOf(element)],
    );
  }
}
