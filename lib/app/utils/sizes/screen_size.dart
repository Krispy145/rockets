import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:rockets/app/utils/logger/logger.dart';

class ScreenSize {
  final double width;
  final double height;
  const ScreenSize({required this.width, required this.height});

  double dimension(Axis axis) => axis == Axis.vertical ? height : width;
  static Size _size(BuildContext context) => MediaQuery.sizeOf(context);

  static bool isMobile(BuildContext context) => getDeviceType(_size(context)) == DeviceScreenType.mobile;
  static bool isDesktop(BuildContext context) => getDeviceType(_size(context)) == DeviceScreenType.desktop;
  static bool isTablet(BuildContext context) => getDeviceType(_size(context)) == DeviceScreenType.tablet;

  static T valueForScreen<T>(BuildContext context, {required T mobile, T? tablet, T? desktop}) {
    Logger.print("Calling valueForScreen", [LoggerFeature.navigation]);
    if (isDesktop(context) && desktop != null) return desktop;
    if ((isTablet(context) || isDesktop(context)) && tablet != null) return tablet;
    return mobile;
  }
}

class ScreenSizes {
  static const small = ScreenSize(width: 320, height: 667);
  static const medium = ScreenSize(width: 375, height: 812);
  static const large = ScreenSize(width: 428, height: 926);

  static List<ScreenSize> get ordered => [small, medium, large];
}

double screenWidth(BuildContext context) => MediaQuery.sizeOf(context).width;
double screenHeight(BuildContext context) => MediaQuery.sizeOf(context).height;
