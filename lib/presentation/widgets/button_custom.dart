import 'package:fe_test_project/utils/color_assets.dart';
import 'package:flutter/material.dart';

class ButtonCustom extends StatefulWidget {
  const ButtonCustom({
    super.key,
    required this.isLoading,
    required this.isEnable,
    this.onTap,
    this.text,
    this.textStyle,
    required this.height,
    this.width,
    this.child,
    this.radius,
  });

  final bool isLoading;
  final bool isEnable;
  final VoidCallback? onTap;
  final String? text;
  final TextStyle? textStyle;
  final double height;
  final double? width;
  final Widget? child;
  final BorderRadius? radius;

  @override
  State<ButtonCustom> createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
          widget.isEnable ? ColorAssets.primaryColor : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: widget.radius ?? BorderRadius.circular(20.0),
          ),
          elevation: 0,
        ),
        onPressed: widget.isEnable && !widget.isLoading ? widget.onTap : null,
        child: widget.isLoading
            ? const SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(
            strokeWidth: 3.0,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        )
            : (widget.child ??
            Text(
              widget.text ?? "",
              style: widget.textStyle ??
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
            )),
      ),
    );
  }
}
