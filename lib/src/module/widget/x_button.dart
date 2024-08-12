// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
import 'package:check_list_app/core/const/app_color.dart';
import 'package:check_list_app/core/util/app_ext.dart';
import 'package:flutter/material.dart';

class XButton extends StatelessWidget {
  final String? toolTip;
  final GestureTapCallback? onPress;
  final Widget child;
  final BorderRadius? borderRadius;
  final bool enable;
  final Key? key;

  XButton({
    this.toolTip,
    required this.onPress,
    required this.child,
    this.borderRadius,
    this.enable = true,
    this.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.circular(10.0.d),
            child: Material(
              color: Colors.transparent,
              child: toolTip == null
                  ? InkWell(
                      splashColor: primaryColor.withOpacity(0.1),
                      focusColor: primaryColor.withOpacity(0.1),
                      highlightColor: primaryColor.withOpacity(0.1),
                      overlayColor: WidgetStateColor.resolveWith(
                          (states) => primaryColor.withOpacity(0.1)),
                      onTap: onPress,
                    )
                  : Tooltip(key: key,
                      message: toolTip,
                      child: InkWell(
                        onTap: enable ? onPress : null,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
