import 'package:appoeira/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class WorkoutsList extends StatefulWidget {
  const WorkoutsList({super.key});

  @override
  State<WorkoutsList> createState() => _WorkoutsListState();
}

class _WorkoutsListState extends State<WorkoutsList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.workouts),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return SizedBox();
        },
        separatorBuilder: (context, index) {
          return SizedBox();
        },
        itemCount: 1
      ),
    );
  }
}