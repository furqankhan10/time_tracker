import 'package:flutter/material.dart';
import 'package:time_tracker_app/common_widgets/custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton(
      {required String imageUri,
      required String? text,
      required VoidCallback? onPressed,
      Color? color,
      Color? textColor})
      : assert(imageUri != null),
  assert(text != null)
  , super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(imageUri),
              Text(
                text!,
                style: TextStyle(fontSize: 15.0, color: textColor),
              ),
              Opacity(opacity: 0, child: Image.asset(imageUri)),
            ],
          ),
          onPressed: onPressed,
          color: color,
        );
}
