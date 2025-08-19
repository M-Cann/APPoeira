// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get logIn => 'Log In';

  @override
  String get signUp => 'Sign Up';

  @override
  String get email => 'E-mail';

  @override
  String get password => 'Password';

  @override
  String get cancel => 'Cancel';

  @override
  String get clear => 'Clear';

  @override
  String get add => 'Add';

  @override
  String get dontHaveAnAccount => 'Don\'t have an account?';

  @override
  String get doYouHaveAnAccount => 'Do you have an account?';

  @override
  String get homePage => 'Home Page';

  @override
  String get search => 'Search';

  @override
  String get workouts => 'Workouts';

  @override
  String get workout => 'Workout';

  @override
  String get workoutDescription => 'Workout Description';

  @override
  String get calendar => 'Calendar';

  @override
  String get achievements => 'Achievements';

  @override
  String get profile => 'Profile';

  @override
  String get signOut => 'Sign Out';

  @override
  String get settings => 'Settings';

  @override
  String get workoutSettings => 'Workout Settings';

  @override
  String get countdownTime => 'Countdown Time';

  @override
  String get setsTheTimeYouAreGivenToPrepareWhenStartingAWorkout =>
      'Sets the time you are given to prepare when starting a workout.';

  @override
  String get themeSettings => 'Theme Settings';

  @override
  String get startWorkout => 'Start Workout';

  @override
  String get addWorkout => 'Add Workout';

  @override
  String get addWorkoutSecond => 'Add Workout';

  @override
  String get addMovement => 'Add Movement';

  @override
  String get addSet => 'Add Set';

  @override
  String get addRest => 'Add Rest';

  @override
  String get workoutContent => 'Workout Content';

  @override
  String get workoutType => 'Workout Type';

  @override
  String get repetitive => 'Repetitive';

  @override
  String get periodical => 'Periodical';

  @override
  String get duration => 'Duration';

  @override
  String get addWorkoutProgram => 'Add Workout Program';

  @override
  String get workoutProgram => 'Workout Program';

  @override
  String get youVeNeverTrainedBeforeClickAboveToStartTrainingNow =>
      'You\'ve never trained before.\nClick above to start training now.';

  @override
  String get start => 'Start';

  @override
  String get select => 'Select';

  @override
  String get enterText => 'Enter text';

  @override
  String get enterNumber => 'Enter number';

  @override
  String get optional => '(Optional)';

  @override
  String get noMovementInformationFound => 'No movement information found.';

  @override
  String get enterTheMovementName => 'Enter the movement name';

  @override
  String get numberOfSets => 'Number Of Sets';

  @override
  String get numberOfRepetitions => 'Number Of Repetitions';

  @override
  String get weight => 'Weight';

  @override
  String get weightType => 'Weight Type';

  @override
  String get weighted => 'Weighted';

  @override
  String get run => 'Run';

  @override
  String get walk => 'Walk';

  @override
  String get calisthenics => 'Calisthenics';

  @override
  String get cardio => 'Cardio';

  @override
  String get swim => 'Swim';

  @override
  String get stretch => 'Stretch';

  @override
  String get yoga => 'Yoga';

  @override
  String get capoeira => 'Capoeira';

  @override
  String get other => 'Other';

  @override
  String get dumbbell => 'Dumbbell';

  @override
  String get barbell => 'Barbell';

  @override
  String get weightVest => 'Weight Vest';

  @override
  String get wristWeights => 'Wrist Weights';

  @override
  String get ankleWeights => 'Ankle Weights';

  @override
  String get wristAndAnkleWeights => 'Wrist and Ankle Weights';

  @override
  String repsWithCount(Object rep) {
    return '$rep reps';
  }

  @override
  String setsOfReps(int set, int rep) {
    return '$set sets of $rep reps';
  }
}
