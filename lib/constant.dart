import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kScaffoldBcolor = Color(0xFFEAECC6);

const kBlueyColor = Color(0xFF2BC0E4);

const kTodoTextStyle = TextStyle(
    color: Color(0xFF2BC0E4), fontSize: 30.0, fontWeight: FontWeight.w700);

const kPastTaskTextStyle = TextStyle(
    color: Colors.grey,
    fontStyle: FontStyle.italic,
    fontSize: 30.0,
    fontWeight: FontWeight.w900);

const kTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.zero),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffc4821f), width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffc4821f), width: 2.0),
  ),
);

const kBottomButtonTextStyle = TextStyle(
  color: Color(0xffc4821f),
  fontWeight: FontWeight.w700,
);

const kTaskTextFieldDecoration = InputDecoration(
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFF2BC0E4),
    ),
  ),
);
