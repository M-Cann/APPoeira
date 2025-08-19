import 'package:appoeira/common_functions/common_functions.dart';
import 'package:appoeira/l10n/app_localizations.dart';
import 'package:appoeira/pages/workouts/screens/workouts_list.dart';
import 'package:appoeira/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddWorkout extends StatefulWidget {
  const AddWorkout({super.key});

  @override
  State<AddWorkout> createState() => _AddWorkoutState();
}

class _AddWorkoutState extends State<AddWorkout> {
  TextEditingController moveNameController = TextEditingController();
  TextEditingController explanationController = TextEditingController();
  TextEditingController numberOfSetsController = TextEditingController();
  TextEditingController numberOfRepetitionsController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  List<Set> setList = [];
  List<Move> movesList = [];
  int isAddingSet = 0; //0 = Nothing, 1 = Adding Set, 2 = Adding Rest
  bool isAddingMovement = false;
  bool isRepetitive = true;
  bool isWeighted = false;
  int? selectedWorkoutTypeId;
  int? selectedWeightTypeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.addWorkout),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w) + EdgeInsets.only(top: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.workoutType),
            SizedBox(height: 4.h,),
            GestureDetector(
              onTap: () {
                showDialog(context: context, builder: (context) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: colorBackground,
                                  borderRadius: BorderRadius.all(Radius.circular(containerRadius))
                                ),
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                       setState(() {
                                         selectedWorkoutTypeId = publicWorkoutTypesList[index].typeId;
                                         Navigator.pop(context);
                                       });
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                        child: Text(workoutTypeIdToString(context, publicWorkoutTypesList[index].typeId,),
                                          style: TextStyle(
                                            decoration: TextDecoration.none,
                                            color: colorTextMain,
                                            fontSize: 12.sp
                                          ),
                                        ),
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
                                  itemCount: publicWorkoutTypesList.length
                                ),
                              ),
                              Positioned(
                                right: -8.w,
                                top: -8.h,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 24.w,
                                    height: 24.w,
                                    decoration: BoxDecoration(
                                      color: colorRedBackground,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(child: Icon(Icons.close, color: Colors.white, size: 16.w,)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },);
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: containerDecoration,
                child: Text(selectedWorkoutTypeId != null ? workoutTypeIdToString(context, selectedWorkoutTypeId!) : AppLocalizations.of(context)!.select)
              ),
            ),
            SizedBox(height: 16.h,),
            Text('${AppLocalizations.of(context)!.workoutDescription} ${AppLocalizations.of(context)!.optional}'),
            SizedBox(height: 4.h,),
            TextField(
              controller: explanationController,
              minLines: 3,
              maxLines: 9,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.enterText,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  borderSide: BorderSide(width: 1.w, color: Colors.blueGrey),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  borderSide: BorderSide(width: 1.w, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 16.h,),
            Text(AppLocalizations.of(context)!.workoutContent,),
            SizedBox(height: 4.h,),
            Visibility(
              visible: setList.isNotEmpty,
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(bottom: 16.h),
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text(setList[index].movesList!.first.name)),
                      SizedBox(width: 8.w,),
                      Text(AppLocalizations.of(context)!.setsOfReps(setList[index].numberOfSets, setList[index].movesList!.first.numberOfRepetitions)),
                      SizedBox(width: 8.w,),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            setList.removeAt(index);
                          });
                        },
                        child: Icon(Icons.delete)
                      )
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
                itemCount: setList.length
              ),
            ),
            GestureDetector(
              onTap: () {
                if(isAddingSet == 0){
                  setState(() {
                    isAddingSet = 1;
                  });
                }
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: containerDecoration,
                child: isAddingSet == 0
                  ? Center(child: Text(AppLocalizations.of(context)!.addSet))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppLocalizations.of(context)!.numberOfSets,),
                        SizedBox(height: 4.h,),
                        TextField(
                          controller: numberOfSetsController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.enterNumber,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.r)),
                              borderSide: BorderSide(width: 1.w, color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.r)),
                              borderSide: BorderSide(width: 1.w, color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h,),
                        Visibility(
                          visible: movesList.isNotEmpty,
                          child: ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.only(bottom: 16.h),
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(child: Text(movesList[index].name)),
                                    SizedBox(width: 8.w,),
                                    Text(AppLocalizations.of(context)!.repsWithCount(movesList[index].numberOfRepetitions)),
                                    SizedBox(width: 8.w,),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            movesList.removeAt(index);
                                          });
                                        },
                                        child: Icon(Icons.delete)
                                    )
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
                              itemCount: movesList.length
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if(!isAddingMovement){
                              setState(() {
                                isAddingMovement = true;
                              });
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                            decoration: containerDecoration,
                            child: !isAddingMovement
                              ? Center(child: Text(AppLocalizations.of(context)!.addMovement))
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(AppLocalizations.of(context)!.enterTheMovementName,),
                                    SizedBox(height: 4.h,),
                                    TextField(
                                      controller: moveNameController,
                                      decoration: InputDecoration(
                                        hintText: AppLocalizations.of(context)!.enterText,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                                          borderSide: BorderSide(width: 1.w, color: Colors.blueGrey),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                                          borderSide: BorderSide(width: 1.w, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 16.h,),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isRepetitive = true;
                                              });
                                            },
                                            child: Text(AppLocalizations.of(context)!.repetitive,
                                              style: TextStyle(color: isRepetitive ? colorTextMain : colorTextSecondary),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isRepetitive = false;
                                              });
                                            },
                                            child: Text(AppLocalizations.of(context)!.periodical,
                                              style: TextStyle(color: !isRepetitive ? colorTextMain : colorTextSecondary),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4.h,),
                                    Row(
                                        children: [
                                          Expanded(
                                            child: Divider(
                                              height: isRepetitive ? 1.h : 0,
                                              thickness: isRepetitive ? 1.h : 0,
                                              color: isRepetitive ? Colors.black : Colors.transparent,
                                            ),
                                          ),
                                          Expanded(
                                            child: Divider(
                                              height: !isRepetitive ? 1.h : 0,
                                              thickness: !isRepetitive ? 1.h : 0,
                                              color: !isRepetitive ? Colors.black : Colors.transparent,
                                            ),
                                          ),
                                        ]
                                    ),
                                    SizedBox(height: 16.h,),
                                    if(isRepetitive)...{
                                      Text(AppLocalizations.of(context)!.numberOfRepetitions,),
                                      SizedBox(height: 4.h,),
                                      TextField(
                                        controller: numberOfRepetitionsController,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          hintText: AppLocalizations.of(context)!.enterNumber,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(8.r)),
                                            borderSide: BorderSide(width: 1.w, color: Colors.blueGrey),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(8.r)),
                                            borderSide: BorderSide(width: 1.w, color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16.h,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(AppLocalizations.of(context)!.weighted),
                                          Checkbox(
                                            value: isWeighted,
                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            onChanged: (value) {
                                              setState(() {
                                                isWeighted = value!;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      Visibility(
                                          visible: isWeighted,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 16.h,),
                                              Text(AppLocalizations.of(context)!.weightType,),
                                              SizedBox(height: 4.h,),
                                              GestureDetector(
                                                onTap: () {
                                                  showDialog(context: context, builder: (context) {
                                                    return Center(
                                                      child: Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.h),
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            Stack(
                                                              clipBehavior: Clip.none,
                                                              children: [
                                                                Container(
                                                                  decoration: BoxDecoration(
                                                                      color: colorBackground,
                                                                      borderRadius: BorderRadius.all(Radius.circular(containerRadius))
                                                                  ),
                                                                  child: ListView.separated(
                                                                      shrinkWrap: true,
                                                                      physics: const NeverScrollableScrollPhysics(),
                                                                      itemBuilder: (context, index) {
                                                                        return GestureDetector(
                                                                          onTap: () {
                                                                            setState(() {
                                                                              selectedWeightTypeId = publicWeightTypesList[index].typeId;
                                                                              Navigator.pop(context);
                                                                            });
                                                                          },
                                                                          child: Padding(
                                                                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                                                            child: Text(weightTypeIdToString(context, publicWeightTypesList[index].typeId,),
                                                                              style: TextStyle(
                                                                                  decoration: TextDecoration.none,
                                                                                  color: colorTextMain,
                                                                                  fontSize: 12.sp
                                                                              ),
                                                                            ),
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
                                                                      itemCount: publicWeightTypesList.length
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  right: -8.w,
                                                                  top: -8.h,
                                                                  child: GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.pop(context);
                                                                    },
                                                                    child: Container(
                                                                      width: 24.w,
                                                                      height: 24.w,
                                                                      decoration: BoxDecoration(
                                                                        color: colorRedBackground,
                                                                        shape: BoxShape.circle,
                                                                      ),
                                                                      child: Center(child: Icon(Icons.close, color: Colors.white, size: 16.w,)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },);
                                                },
                                                child: Container(
                                                    width: double.infinity,
                                                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                                    decoration: containerDecoration,
                                                    child: Text(selectedWeightTypeId != null ? weightTypeIdToString(context, selectedWeightTypeId!) : AppLocalizations.of(context)!.select)
                                                ),
                                              ),
                                              SizedBox(height: 16.h,),
                                              Text(AppLocalizations.of(context)!.weight,),
                                              SizedBox(height: 4.h,),
                                              TextField(
                                                controller: weightController,
                                                keyboardType: TextInputType.number,
                                                decoration: InputDecoration(
                                                  hintText: AppLocalizations.of(context)!.enterNumber,
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                                                    borderSide: BorderSide(width: 1.w, color: Colors.blueGrey),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                                                    borderSide: BorderSide(width: 1.w, color: Colors.grey),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                      ),
                                    }else...{
                                      Text(AppLocalizations.of(context)!.duration,),
                                      SizedBox(height: 4.h,),
                                      TextField(
                                        controller: durationController,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          hintText: AppLocalizations.of(context)!.enterNumber,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(8.r)),
                                            borderSide: BorderSide(width: 1.w, color: Colors.blueGrey),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(8.r)),
                                            borderSide: BorderSide(width: 1.w, color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                    },
                                    SizedBox(height: 16.h,),
                                    Row(
                                      children: [
                                        Expanded(child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              isAddingMovement = false;
                                            });
                                          },
                                          child: Text(AppLocalizations.of(context)!.cancel),
                                        ),),
                                        SizedBox(width: 16.w,),
                                        Expanded(child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              isAddingMovement = false;
                                              movesList.add(Move(moveNameController.text, int.parse(numberOfRepetitionsController.text), weightController.text.isNotEmpty ? double.parse(weightController.text) : null));
                                            });
                                            moveNameController.clear();
                                            numberOfRepetitionsController.clear();
                                            durationController.clear();
                                            weightController.clear();
                                          },
                                          child: Text(AppLocalizations.of(context)!.add),
                                        ),)
                                      ],
                                    ),
                                  ],
                                ),
                          ),
                        ),
                        SizedBox(height: 16.h,),
                        Row(
                          children: [
                            Expanded(child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isAddingSet = 0;
                                });
                              },
                              child: Text(AppLocalizations.of(context)!.cancel),
                            ),),
                            SizedBox(width: 16.w,),
                            Expanded(child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isAddingSet = 0;
                                  setList.add(Set(int.parse(numberOfSetsController.text), List.from(movesList), 3));
                                });
                                movesList.clear();
                                moveNameController.clear();
                                explanationController.clear();
                                numberOfSetsController.clear();
                                numberOfRepetitionsController.clear();
                                durationController.clear();
                                weightController.clear();
                              },
                              child: Text(AppLocalizations.of(context)!.add),
                            ),)
                          ],
                        ),
                      ],
                    ),
              ),
            ),
            SizedBox(height: 16.h,),
            Row(
              children: [
                Expanded(child: ElevatedButton(
                  onPressed: () {
                    setList.clear();
                    movesList.clear();
                    moveNameController.clear();
                    explanationController.clear();
                    numberOfSetsController.clear();
                    numberOfRepetitionsController.clear();
                    durationController.clear();
                    weightController.clear();
                  },
                  child: Text(AppLocalizations.of(context)!.clear),
                ),),
                SizedBox(width: 16.w,),
                Expanded(child: ElevatedButton(
                  onPressed: () {

                  },
                  child: Text(AppLocalizations.of(context)!.addWorkoutSecond),
                ),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

