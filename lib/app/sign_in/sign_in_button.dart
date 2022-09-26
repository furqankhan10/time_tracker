import 'package:flutter/material.dart';
import 'package:time_tracker_app/common_widgets/custom_raised_button.dart';

class SignInButton extends CustomRaisedButton {
  SignInButton(
      {required String? text,
      Color? color,
      Color? texColor,
      required VoidCallback? onPressed})
      :assert(text != null), super(
          child: Text(
            text!,
            style: TextStyle(color: texColor, fontSize: 15.0),
          ),
          color: color,
          onPressed: onPressed,
          borderRadius: 4.0,
        );
}
