import 'package:flutter/material.dart';

class ReactionButton extends IconButton {

  const ReactionButton({super.key, required super.onPressed, required super.icon, required super.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      iconSize: 30,
      color: color,
      onPressed: onPressed,
    );
  }
}
