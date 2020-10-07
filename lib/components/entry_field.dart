import 'package:flutter/material.dart';
import 'package:flutter_challenge/utils/constants.dart';

class EntryField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String image;
  final String initialValue;
  final bool readOnly;
  final TextInputType keyboardType;
  final int maxLength;
  final int maxLines;
  final String hint;
  final IconData suffixIcon;
  final Function onTap;
  final Function onChanged;
  final TextCapitalization textCapitalization;
  final Function onSuffixPressed;
  final Function onSubmitted;
  final bool showCountryCode;
  final bool obscureText;
  final String text;
  final FocusNode node;
  final TextInputAction textInputAction;

  EntryField({
    this.controller,
    this.label,
    this.image,
    this.initialValue,
    this.readOnly,
    this.keyboardType,
    this.maxLength,
    this.hint,
    this.suffixIcon,
    this.maxLines,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.text,
    this.textCapitalization,
    this.onSuffixPressed,
    this.showCountryCode = false,
    this.obscureText = false,
    this.node,
    this.textInputAction,
  });

  @override
  _EntryFieldState createState() => _EntryFieldState();
}

class _EntryFieldState extends State<EntryField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            widget.label ?? '',
            style: Theme.of(context).textTheme.headline5.copyWith(
                color: Theme.of(context).primaryColorDark, fontSize: 22),
          ),
          TextFormField(
            style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16),
            focusNode: widget.node,
            textCapitalization:
                widget.textCapitalization ?? TextCapitalization.sentences,
            cursorColor: kColorPrimary,
            autofocus: false,
            onTap: widget.onTap ?? null,
            onFieldSubmitted: widget.onSubmitted ?? null,
            textInputAction: widget.textInputAction ?? TextInputAction.done,
            controller: widget.controller,
            onChanged: widget.onChanged,
            readOnly: widget.readOnly ?? false,
            keyboardType: widget.keyboardType,
            minLines: 1,
            initialValue: widget.initialValue,
            maxLength: widget.maxLength,
            maxLines: widget.maxLines ?? 1,
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              prefixText: widget.showCountryCode ? '+91 ' : '',
              suffixIcon: IconButton(
                icon: Icon(
                  widget.suffixIcon,
                  size: 40.0,
                  color: kColorPrimary,
                ),
                onPressed: widget.onSuffixPressed ?? null,
              ),
              hintText: widget.hint,
              prefixStyle: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
              hintStyle:
                  Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 18),
              counter: Offstage(),
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
