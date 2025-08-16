import 'package:appoeira/l10n/app_localizations.dart';
import 'package:appoeira/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutProgram extends StatefulWidget {
  const WorkoutProgram({super.key});

  @override
  State<WorkoutProgram> createState() => _WorkoutProgramState();
}

class _WorkoutProgramState extends State<WorkoutProgram> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.workoutProgram),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w) + EdgeInsets.only(top: 16.h),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}