library flutter_hot_toast;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:lottie/lottie.dart';

enum FlutterHotToastType {
  success,
  loading,
  error,
}

class FlutterHotToast {
  /// Invokes success flutter hot toast
  static Widget success(
    BuildContext context, {
    /// The duration in milliseconds
    int? duration,

    /// The height of flutter hot toast
    required double height,

    /// The width of flutter hot toast
    required double width,

    /// The border radius of flutter hot toast
    double? borderRadius,

    /// The shadow color of flutter hot toast
    Color? shadowColor,

    /// The actual toast color of flutter hot toast
    Color? toastColor,

    /// A nullable indicator widget used
    Widget? indicatorWidget,

    /// The label of the flutter hot toast
    required Text label,

    /// The alignmnet of the flutter hot toast
    Alignment? alignment,
  }) {
    context.loaderOverlay.hide();
    Future.delayed(Duration(milliseconds: duration ?? 2000), () {
      context.loaderOverlay.hide();
    });
    return HotToast(
      type: FlutterHotToastType.success,
      toastColor: toastColor,
      height: height,
      width: width,
      borderRadius: borderRadius,
      shadowColor: shadowColor,
      indicatorWidget: indicatorWidget,
      label: label,
      alignment: alignment,
    );
  }

  /// Invokes loading flutter hot toast. There are some parameters that are missing from the
  /// loading flutter hot toast, eg: duration and context is missing because I assume you will use
  /// it in an asyn callback so the duration is not really specific as the wait time is undetermined.
  /// Also the context is being used to hide the loading toast in the success and error toast before they
  /// called, therefore there is no need to use context in the loading toast.

  static Widget loading({
    /// The height of flutter hot toast
    required double height,

    /// The width of flutter hot toast
    required double width,

    /// The border radius of flutter hot toast
    double? borderRadius,

    /// The shadow color of flutter hot toast
    Color? shadowColor,

    /// The actual toast color of flutter hot toast
    Color? toastColor,

    /// A nullable indicator widget used
    Widget? indicatorWidget,

    /// The label of the flutter hot toast
    required Text label,

    /// The alignmnet of the flutter hot toast
    Alignment? alignment,
  }) {
    return HotToast(
      type: FlutterHotToastType.loading,
      toastColor: toastColor,
      height: height,
      width: width,
      borderRadius: borderRadius,
      shadowColor: shadowColor,
      indicatorWidget: indicatorWidget,
      label: label,
      alignment: alignment,
    );
  }

  /// Invokes error flutter hot toast
  static Widget error(
    BuildContext context, {
    /// The duration in milliseconds
    int? duration,

    /// The height of flutter hot toast
    required double height,

    /// The width of flutter hot toast
    required double width,

    /// The border radius of flutter hot toast
    double? borderRadius,

    /// The shadow color of flutter hot toast
    Color? shadowColor,

    /// The actual toast color of flutter hot toast
    Color? toastColor,

    /// A nullable indicator widget used
    Widget? indicatorWidget,

    /// The label of the flutter hot toast
    required Text label,

    /// The alignmnet of the flutter hot toast
    Alignment? alignment,
  }) {
    context.loaderOverlay.hide();
    Future.delayed(Duration(milliseconds: duration ?? 2000), () {
      context.loaderOverlay.hide();
    });
    return HotToast(
      alignment: alignment,
      type: FlutterHotToastType.error,
      toastColor: toastColor,
      height: height,
      width: width,
      borderRadius: borderRadius,
      shadowColor: shadowColor,
      indicatorWidget: indicatorWidget,
      label: label,
    );
  }
}

class HotToast extends StatelessWidget {
  const HotToast({
    super.key,
    required this.height,
    required this.width,
    this.borderRadius,
    this.shadowColor,
    this.toastColor,
    this.indicatorWidget,
    required this.label,
    required this.type,
    this.alignment,
  });
  final Color? toastColor;
  final double height;
  final double width;
  final double? borderRadius;
  final Color? shadowColor;
  final Widget? indicatorWidget;
  final Text label;
  final FlutterHotToastType type;
  final duration = 200;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: height / 10),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: toastColor ?? Colors.white,
          borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 2,
              spreadRadius: 2,
              color: shadowColor ?? Colors.black12,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(children: [
            indicatorWidget ??
                (type == FlutterHotToastType.loading
                    ? SizedBox.square(
                        dimension: 23,
                        child: CircularProgressIndicator(
                          color: Colors.grey.shade900,
                          backgroundColor: Colors.grey,
                          strokeWidth: 2,
                        ),
                      )
                    : type == FlutterHotToastType.success
                        ? Lottie.asset(
                            'assets/success.json',
                            width: 45,
                            height: 45,
                          )
                        : Lottie.asset(
                            'assets/error.json',
                            height: 60,
                            width: 60,
                          )),
            const SizedBox(
              width: 30,
            ),
            label
          ]),
        ),
      )
          .animate()
          .scale(
            curve: Curves.easeOutCirc,
            duration: Duration(milliseconds: duration),
            begin: const Offset(0.3, 0.3),
            end: const Offset(0.6, 0.6),
            alignment: Alignment.center,
          )
          .slideY(
            curve: Curves.easeOutCirc,
            duration: Duration(milliseconds: duration),
            begin: 0.4,
            end: 0.6,
          ),
    );
  }
}
