import 'package:flutter/material.dart';
import 'constant.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  BottomButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Color(0xfffaf09b),
        side: BorderSide(color: Color(0xffc4821f)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: kBottomButtonTextStyle,
      ),
    );
  }
}
