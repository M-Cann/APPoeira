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
  String get dontHaveAnAccount => 'Don\'t have an account?';

  @override
  String get doYouHaveAnAccount => 'Do you have an account?';

  @override
  String get homePage => 'Home Page';

  @override
  String get workouts => 'Workouts';

  @override
  String get workout => 'Workout';

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
  String get addWorkoutProgram => 'Add Workout Program';

  @override
  String get workoutProgram => 'Workout Program';

  @override
  String get youVeNeverTrainedBeforeClickAboveToStartTrainingNow =>
      'You\'ve never trained before.\nClick above to start training now.';

  @override
  String get start => 'Start';

  @override
  String get noMovementInformationFound => 'No movement information found.';

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
  String setsOfReps(int set, int rep) {
    return '$set sets of $rep reps';
  }
}
