import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Future<bool?> showAlertDialog(BuildContext context,{required String title,required String content,
  String? cancelActionText,
  required String defaultActionText}){
  if(!Platform.isIOS){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              if(cancelActionText != null)
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(defaultActionText),
              ),
              FlatButton(
                  child: Text(defaultActionText),
                onPressed: ()=>Navigator.of(context).pop(true),
              )

            ],
          );
        }
    );
  }else{
    return showCupertinoDialog(
        context: context,
        builder: (context){
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              if(cancelActionText != null)
                CupertinoDialogAction(
                  child: Text(cancelActionText),
                  onPressed: ()=> Navigator.of(context).pop(false),
                ),
              CupertinoDialogAction(
                  child: Text(defaultActionText),
                  onPressed: ()=> Navigator.of(context).pop(true),
              )
            ],
          );
        });
  }

}