import 'package:flutter/material.dart';
import 'package:rockets/app/utils/sizes/spacers.dart';

class AppEdgeInsets extends EdgeInsets {
  const AppEdgeInsets.zero() : super.all(0);

  AppEdgeInsets.only(
    BuildContext context, {
    Sizes? left,
    Sizes? right,
    Sizes? top,
    Sizes? bottom,
    SizeTypes type = SizeTypes.fixed,
  }) : super.only(
          left: left?.points(context, axis: Axis.horizontal, type: type) ?? 0,
          right: right?.points(context, axis: Axis.horizontal, type: type) ?? 0,
          top: top?.points(context, axis: Axis.vertical, type: type) ?? 0,
          bottom: bottom?.points(context, axis: Axis.vertical, type: type) ?? 0,
        );

  AppEdgeInsets.symmetric(
    BuildContext context, {
    Sizes? horizontal,
    Sizes? vertical,
    SizeTypes type = SizeTypes.fixed,
  }) : super.symmetric(
          horizontal: horizontal?.points(context, axis: Axis.horizontal, type: type) ?? 0,
          vertical: vertical?.points(context, axis: Axis.vertical, type: type) ?? 0,
        );

  AppEdgeInsets.all(
    BuildContext context,
    Sizes size, {
    SizeTypes type = SizeTypes.fixed,
  }) : super.all(size.points(context, axis: Axis.vertical, type: type));
}
