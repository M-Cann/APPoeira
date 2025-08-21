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
        workoutsList.add(Workout(DateFormat('dd/MM/yyyy HH:mm').format(DateTime(2025, 08, 16)), 4, 90, [Move('Şınav', 5, 12, null, null), Move('Ring Pull', 5, 8, 4, 8.5), Move('Dips', 5, 6, null, null), Move('Mekik', 5, 12, null, null), Move('Squat', 5, 12, null, null)]));
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
                              Text(workoutTypeIdToString(context, workoutsList[index].workoutTypeId)),
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
                        workoutsList[index].moveList != null && workoutsList[index].moveList!.isEmpty
                          ? Text(AppLocalizations.of(context)!.noMovementInformationFound)
                          : ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index2) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(flex: 2, child: Text(workoutsList[index].moveList![index2].name)),
                                    SizedBox(width: 8.w,),
                                    Expanded(flex: 3, child: Text(workoutsList[index].moveList![index2].weightType == null ? '' : '${workoutsList[index].moveList![index2].weight!}kg ${weightTypeIdToString(context, workoutsList[index].moveList![index2].weightType!)}')),
                                    SizedBox(width: 8.w,),
                                    Expanded(flex: 2, child: Text(AppLocalizations.of(context)!.setsOfReps(workoutsList[index].moveList![index2].numberOfSets, workoutsList[index].moveList![index2].numberOfRepetitions))),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                height: 1.h,
                                thickness: 1.h,
                                color: Colors.grey,
                              );
                            },
                            itemCount: workoutsList[index].moveList!.length
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
  Workout(this.date, this.workoutTypeId, this.duration, this.moveList);

  String date;
  int workoutTypeId;
  int? duration;
  List<Move>? moveList;
}

class WorkoutType{
  WorkoutType(this.typeId, this.name);

  int typeId;
  String name;
}

class Move{
  Move(this.name, this.numberOfSets, this.numberOfRepetitions, this.weightType, this.weight);

  String name;
  int numberOfSets;
  int numberOfRepetitions;
  int? weightType;
  double? weight;
}

class WeightType{
  WeightType(this.typeId, this.name);

  int typeId;
  String name;
}

//Public Parameters
List<WorkoutType> publicWorkoutTypesList = [
  WorkoutType(1, 'Diğer'),
  WorkoutType(2, 'Koşu'),
  WorkoutType(3, 'Yürüyüş'),
  WorkoutType(4, 'Calisthenics'),
  WorkoutType(5, 'Kardiuo'),
  WorkoutType(6, 'Yüzme'),
  WorkoutType(7, 'Esneme'),
  WorkoutType(8, 'Yoga'),
  WorkoutType(9, 'Capoeira'),
];

List<WeightType> publicWeightTypesList = [
  WeightType(0, 'Yok'),
  WeightType(1, 'Diğer'),
  WeightType(2, 'Dambıl'),
  WeightType(3, 'Halter'),
  WeightType(4, 'Ağırlık Yeleği'),
  WeightType(5, 'El Bilek Ağırlığı'),
  WeightType(6, 'Ayak Bilek Ağırlığı'),
  WeightType(7, 'El ve Ayak Bilek Ağırlığı'),
];