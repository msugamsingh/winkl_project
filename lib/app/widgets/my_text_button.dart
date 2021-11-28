import 'package:flutter/material.dart';
import 'package:winkl_project/app/theme/styles.dart';

class MyTextButton extends StatelessWidget {
  final String? label;
  final Widget? child;
  final Color? color;
  final TextStyle? style;
  final VoidCallback onTap;
  final EdgeInsets? padding;

  const MyTextButton({
    Key? key,
    this.label,
    this.color,
    this.child,
    required this.onTap,
    this.style,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
          padding: padding ?? EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          primary: color ?? Colors.blueGrey[900],
          textStyle: style ?? Styles.tsRegular14bold
          ),
      child: child ?? Text(label!),
    );
  }
}
