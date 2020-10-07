import 'package:flutter/material.dart';
import 'package:flutter_challenge/utils/app_constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;
  final Color iconColor;
  final double elevation;
  final Function onPressed;

  RoundIconButton(
      {@required this.icon,
      this.size,
      this.color,
      this.iconColor,
      this.elevation,
      @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      elevation: elevation ?? 0,
      fillColor: color ?? Colors.white,
      child: Icon(
        icon,
        color: iconColor ?? AppConstants.buttonBlue,
        size: 22,
      ),
      constraints: BoxConstraints.tightFor(
        width: size ?? 56,
        height: size ?? 56,
      ),
    );
  }
}
