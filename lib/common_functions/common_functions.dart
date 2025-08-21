import 'package:appoeira/l10n/app_localizations.dart';
import 'package:appoeira/pages/workouts/screens/workouts_list.dart';
import 'package:flutter/cupertino.dart';

String durationToString(int duration){
  String hour = (duration ~/ 60).toString();
  String minute = (duration % 60).toString();
  return '${hour.padLeft(2, '0')}:${minute.padLeft(2, '0')}';
}

String workoutTypeIdToString(BuildContext context, int id){
  switch(id){
    case 1:
      return AppLocalizations.of(context)!.other;
    case 2:
      return AppLocalizations.of(context)!.run;
    case 3:
      return AppLocalizations.of(context)!.walk;
    case 4:
      return AppLocalizations.of(context)!.calisthenics;
    case 5:
      return AppLocalizations.of(context)!.cardio;
    case 6:
      return AppLocalizations.of(context)!.swim;
    case 7:
      return AppLocalizations.of(context)!.stretch;
    case 8:
      return AppLocalizations.of(context)!.yoga;
    case 9:
      return AppLocalizations.of(context)!.capoeira;
    default:
      return AppLocalizations.of(context)!.other;
  }
}

String weightTypeIdToString(BuildContext context, int id){
  switch(id){
    case 0:
      return AppLocalizations.of(context)!.no;
    case 1:
      return AppLocalizations.of(context)!.other;
    case 2:
      return AppLocalizations.of(context)!.dumbbell;
    case 3:
      return AppLocalizations.of(context)!.barbell;
    case 4:
      return AppLocalizations.of(context)!.weightVest;
    case 5:
      return AppLocalizations.of(context)!.wristWeights;
    case 6:
      return AppLocalizations.of(context)!.ankleWeights;
    case 7:
      return AppLocalizations.of(context)!.wristAndAnkleWeights;
    default:
      return AppLocalizations.of(context)!.other;
  }
}