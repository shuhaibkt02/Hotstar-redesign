import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onpress;
  final Color? iconColors;
  final double? opacity;
  final double? radius;
  final double? iconSize;
  final bool? noPadding;
  final AlignmentGeometry? alignment;
  final IconData icon;
  final Widget? iconWidget;
  const CustomIconButton({
    super.key,
    required this.onpress,
    required this.icon,
    this.opacity,
    this.alignment,
    this.radius,
    this.noPadding,
    this.iconSize,
    this.iconColors,
    this.iconWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: noPadding == true
          ? const EdgeInsets.all(0)
          : const EdgeInsets.all(8.0),
      child: Align(
        alignment: alignment ?? Alignment.topRight,
        child: CircleAvatar(
          backgroundColor: Colors.grey.shade600.withOpacity(opacity ?? 0.6),
          radius: radius ?? 20,
          child: IconButton(
            onPressed: onpress,
            icon: Icon(
              icon,
              size: iconSize ?? 22,
              color: iconColors ?? Colors.grey.shade400,
            ),
          ),
        ),
      ),
    );
  }
}
