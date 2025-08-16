import 'package:appoeira/common_functions/common_functions.dart';
import 'package:appoeira/l10n/app_localizations.dart';
import 'package:appoeira/pages/workouts/screens/add_workout.dart';
import 'package:appoeira/pages/workouts/screens/start_workout.dart';
import 'package:appoeira/pages/workouts/screens/workout_program.dart';
import 'package:appoeira/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class WorkoutsList extends StatefulWidget {
  const WorkoutsList({super.key});

  @override
  State<WorkoutsList> createState() => _WorkoutsListState();
}

class _WorkoutsListState extends State<WorkoutsList> {
  List<Workout> workoutsList = [];
  List<WorkoutFloatingAction> floatingActionsList = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        floatingActionsList.add(WorkoutFloatingAction(AppLocalizations.of(context)!.startWorkout, Icon(Icons.add), StartWorkout()));
        floatingActionsList.add(WorkoutFloatingAction(AppLocalizations.of(context)!.addWorkout, Icon(Icons.add), AddWorkout()));
        floatingActionsList.add(WorkoutFloatingAction(AppLocalizations.of(context)!.addWorkoutProgram, Icon(Icons.add_chart), WorkoutProgram()));
        
        //BURASI silinecek
        workoutsList.add(Workout(DateFormat('dd/MM/yyyy HH:mm').format(DateTime(2025, 08, 16)), WorkoutType.calisthenics, 90, [Moves('Şınav', 5, 12, null), Moves('Ring Pull', 5, 8, 8.5), Moves('Dips', 5, 6, null), Moves('Mekik', 5, 12, null), Moves('Squat', 5, 12, 5)]));
        //
      });
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.workouts),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const StartWorkout()),),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: containerDecoration,
                child: Center(child: Text(AppLocalizations.of(context)!.startWorkout)),
              ),
            ),
            workoutsList.isEmpty
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Text(AppLocalizations.of(context)!.youVeNeverTrainedBeforeClickAboveToStartTrainingNow,
                      textAlign: TextAlign.center,
                    ),
                )
              : ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ExpansionTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(workoutTypeToString(context, workoutsList[index].type)),
                              Text(workoutsList[index].date),
                            ],
                          ),
                          SizedBox(width: 16.w,),
                          Visibility(
                            visible: workoutsList[index].duration != null && workoutsList[index].duration != 0,
                            child: Text(durationToString(workoutsList[index].duration!))
                          ),
                        ],
                      ),
                      children: [
                        workoutsList[index].movesList != null && workoutsList[index].movesList!.isEmpty
                          ? Text(AppLocalizations.of(context)!.noMovementInformationFound)
                          : ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index2) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: Text(workoutsList[index].movesList![index2].name)),
                                  SizedBox(width: 8.w,),
                                  Text(AppLocalizations.of(context)!.setsOfReps(workoutsList[index].movesList![index2].numberOfSets, workoutsList[index].movesList![index2].numberOfRepetitions)),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                height: 1.h,
                                thickness: 1.h,
                                color: Colors.grey,
                              );
                            },
                            itemCount: workoutsList[index].movesList!.length
                          )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 8.h,);
                  },
                  itemCount: workoutsList.length
              ),
          ],
        ),
      ),
      floatingActionButton: PopupMenuButton(
        itemBuilder: (context) => <PopupMenuEntry<WorkoutFloatingAction>>[
          for(WorkoutFloatingAction floatingAction in floatingActionsList)...{
            PopupMenuItem<WorkoutFloatingAction>(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => floatingAction.route),),
              child: Text(floatingAction.title)
            ),
          }
        ],
        child: Container(
          width: 50.w,
          height: 50.w,
          decoration: BoxDecoration(
            color: seedColor,
            shape: BoxShape.circle,
          ),
          child: Center(child: Icon(Icons.add, color: colorBackground,)),
        ),
      ),
    );
  }
}

class WorkoutFloatingAction{
  WorkoutFloatingAction(this.title, this.icon, this.route);

  String title;
  Widget icon;
  dynamic route;
}

class Workout{
  Workout(this.date, this.type, this.duration, this.movesList);

  String date;
  WorkoutType type;
  int? duration;
  List<Moves>? movesList;
}

enum WorkoutType {
  run,
  walk,
  calisthenics,
  cardio,
  swim,
  stretch,
  yoga,
  capoeira,
  other
}

class Moves{
  Moves(this.name, this.numberOfSets, this.numberOfRepetitions, this.weight);

  String name;
  int numberOfSets;
  int numberOfRepetitions;
  double? weight;
}

String workoutTypeToString(BuildContext context, WorkoutType type){
  switch(type){
    case WorkoutType.run:
      return AppLocalizations.of(context)!.run;
    case WorkoutType.walk:
      return AppLocalizations.of(context)!.walk;
    case WorkoutType.calisthenics:
      return AppLocalizations.of(context)!.calisthenics;
    case WorkoutType.cardio:
      return AppLocalizations.of(context)!.cardio;
    case WorkoutType.swim:
      return AppLocalizations.of(context)!.swim;
    case WorkoutType.stretch:
      return AppLocalizations.of(context)!.stretch;
    case WorkoutType.yoga:
      return AppLocalizations.of(context)!.yoga;
    case WorkoutType.capoeira:
      return AppLocalizations.of(context)!.capoeira;
    case WorkoutType.other:
      return AppLocalizations.of(context)!.other;
  }
}