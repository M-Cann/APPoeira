import 'package:appoeira/l10n/app_localizations.dart';
import 'package:appoeira/pages/workouts/screens/workouts_list.dart';
import 'package:flutter/cupertino.dart';

String durationToString(int duration){
  String hour = (duration ~/ 60).toString();
  String minute = (duration % 60).toString();
  return '${hour.padLeft(2, '0')}:${minute.padLeft(2, '0')}';
}