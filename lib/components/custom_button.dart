import 'package:flutter/material.dart';
import 'package:flutter_challenge/config/Locale/locales.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color borderColor;
  final Color color;
  final TextStyle style;
  final BorderRadius radius;
  final double padding;
  final bool loading;

  CustomButton({
    this.text,
    this.onPressed,
    this.borderColor,
    this.color,
    this.style,
    this.radius,
    this.padding,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return FlatButton(
      padding: EdgeInsets.symmetric(vertical: padding ?? 18),
      onPressed: loading ? null : onPressed,
      disabledColor: theme.disabledColor,
      color: color ?? theme.buttonColor,
      shape: OutlineInputBorder(
        borderRadius: radius ?? BorderRadius.zero,
        borderSide: BorderSide(color: borderColor ?? Colors.transparent),
      ),
      child: loading
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            )
          : Text(
              text ?? AppLocalizations.of(context).continueText,
              style: style ?? Theme.of(context).textTheme.button,
            ),
    );
  }
}
