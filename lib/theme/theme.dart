import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///COLORS///
//Scaffold Colors
Color colorBackground = Colors.white;
Color colorRedBackground = Colors.red;

//Text Colors
Color colorTextMain = Colors.black;
Color colorTextSecondary = Colors.black45;
Color colorTextError = Colors.red;

//Border Colors
Color colorBorder = Colors.grey;

//Button Colors
Color colorButton = Colors.blueGrey;

Color seedColor = Colors.deepPurple;

///RADIUS///
double containerRadius = 8.r;

///WIDGETS///
BoxDecoration containerDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(containerRadius)),
  border: Border.all(width: 1.w, color: colorBorder)
);