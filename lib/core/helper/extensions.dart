import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// make extension for string
extension WidgetExtension on Widget? {
  /// add tap to parent model
  Widget onTap(Function? function) {
    return GestureDetector(onTap: function as void Function()?, child: this);
  }
}

// make extension for navigation
extension Navigation on BuildContext {

  Future<dynamic> push(Widget page) {
    return Navigator.of(this).push(MaterialPageRoute(builder: (_) => page));
  }

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}

//  extension to check if null or empty
extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension MediaQueryExtension on BuildContext {
  double get height => MediaQuery.sizeOf(this).height.h;
  double get width => MediaQuery.sizeOf(this).width.w;
}
