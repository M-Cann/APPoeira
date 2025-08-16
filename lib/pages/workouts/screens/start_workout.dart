import 'package:appoeira/l10n/app_localizations.dart';
import 'package:appoeira/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartWorkout extends StatefulWidget {
  const StartWorkout({super.key});

  @override
  State<StartWorkout> createState() => _StartWorkoutState();
}

class _StartWorkoutState extends State<StartWorkout> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.workout),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w) + EdgeInsets.only(top: 16.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(32.w),
              decoration: BoxDecoration(
                color: seedColor,
                shape: BoxShape.circle,
              ),
              child: Center(child: Text(AppLocalizations.of(context)!.start,
                style: TextStyle(color: colorBackground),
              )),
            ),
          ],
        ),
      ),
    );
  }
}