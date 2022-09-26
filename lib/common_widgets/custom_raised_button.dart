import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton({
    Key? key,
    this.child,
    required this.onPressed,
    this.color,
    this.borderRadius:2.0,
    this.height : 50.0
  }) : assert(borderRadius != null),
        super(key: key);

  final Widget? child;
  final Color? color;
  final double? borderRadius;
  final VoidCallback? onPressed;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
          child: child,
          color: color,
          disabledColor: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius!))),
          onPressed: onPressed),
    );
  }
}
