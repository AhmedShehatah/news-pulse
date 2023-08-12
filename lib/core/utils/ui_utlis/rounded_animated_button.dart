import 'package:flutter/material.dart';
import 'package:news_pulse/core/utils/string_utils/string_utils.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/di_manager.dart';
import '../../constants/app_fonts.dart';
import '../screen_utlis/device_utils.dart';

class RoundedAnimatedButton extends StatefulWidget {
  final String? text;
  final Color? color;
  final Image? leadingImage;
  final Color? textColor;
  final Widget? child;

  final VoidCallback? onPressed;

  final double? width;
  final double? height;
  final double? borderRadius;

  final bool isActive;
  final bool isBordered;
  final Color? borderColor;

  const RoundedAnimatedButton(
      {Key? key,
      this.text,
      this.child,
      this.color,
      this.leadingImage,
      this.textColor,
      this.onPressed,
      this.width,
      this.height,
      this.borderRadius,
      this.isActive = true,
      this.isBordered = false,
      this.borderColor})
      : super(key: key);

  @override
  _RoundedAnimatedButtonState createState() => _RoundedAnimatedButtonState();
}

class _RoundedAnimatedButtonState extends State<RoundedAnimatedButton> {
  final Duration _animationDuration = const Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    // return Container();
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: widget.isActive ? 1.0 : 0.4,
      child: AnimatedContainer(
        duration: _animationDuration,
        width: widget.width,
        // height: widget.height ?? ScreenHelper.fromHeight55(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            MaterialButton(
              minWidth: widget.width,
              elevation: widget.color == Colors.transparent ? 2.0 : 0.0,
              onPressed: widget.onPressed,
              shape: RoundedRectangleBorder(
                  side: widget.isBordered
                      ? BorderSide(
                          color: widget.borderColor ??
                              DIManager.findDep<AppColorsController>()
                                  .primaryColor,
                          width: ScreenHelper.fromWidth55(0.5))
                      : BorderSide(
                          width: 0.0,
                          color: widget.color ?? Colors.transparent),
                  borderRadius: BorderRadius.circular(
                      (widget.borderRadius ?? ScreenHelper.fromWidth55(0.0)))),
              color: widget.isActive == true
                  ? widget.isBordered == true
                      ? widget.color ?? Colors.transparent
                      : (widget.color ??
                          DIManager.findDep<AppColorsController>().primaryColor)
                  : widget.color ?? Colors.white,
              child: SizedBox(
                height: widget.height ?? ScreenHelper.fromHeight55(6.4),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Opacity(
                        opacity: 0.0,
                        child: widget.leadingImage ?? Container()),
                    Center(
                      child: widget.child ??
                          Text(
                            widget.text!.toTitleCase(),
                            style: TextStyle(
                                color: widget.textColor ?? Colors.white,
                                fontWeight: AppFontWeight.semiBold,
                                fontSize: AppFontSize.fontSize_16),
                          ),
                    ),
                    widget.leadingImage ?? Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
