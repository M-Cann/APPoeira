// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get logIn => 'Giriş Yap';

  @override
  String get signUp => 'Kayıt Ol';

  @override
  String get email => 'E-mail';

  @override
  String get password => 'Şifre';

  @override
  String get dontHaveAnAccount => 'Hesabın yok mu?';

  @override
  String get doYouHaveAnAccount => 'Hesabın var mı?';

  @override
  String get homePage => 'Ana Sayfa';

  @override
  String get workouts => 'Antrenmanlar';

  @override
  String get workout => 'Antrenman';

  @override
  String get calendar => 'Takvim';

  @override
  String get achievements => 'Başarımlar';

  @override
  String get profile => 'Profil';

  @override
  String get signOut => 'Çıkış Yap';

  @override
  String get settings => 'Ayarlar';

  @override
  String get workoutSettings => 'Antrenman Ayarları';

  @override
  String get countdownTime => 'Geri Sayım Süresi';

  @override
  String get setsTheTimeYouAreGivenToPrepareWhenStartingAWorkout =>
      'Antrenmana başlarken hazırlanmanız için verilen süreyi ayarlar.';

  @override
  String get themeSettings => 'Tema Ayarları';

  @override
  String get startWorkout => 'Antrenmana Başla';

  @override
  String get addWorkout => 'Antrenman Ekle';

  @override
  String get addWorkoutProgram => 'Antrenman Programı Ekle';

  @override
  String get workoutProgram => 'Antrenman Programı';

  @override
  String get youVeNeverTrainedBeforeClickAboveToStartTrainingNow =>
      'Hiç antrenman yapmamışsın.\nHemen yukarıya tıklayarak antrenmana başla.';

  @override
  String get start => 'Başlat';

  @override
  String get noMovementInformationFound => 'Hareket bilgisi bulunamadı.';

  @override
  String get run => 'Koşu';

  @override
  String get walk => 'Yürüyüş';

  @override
  String get calisthenics => 'Calisthenics';

  @override
  String get cardio => 'Kardiyo';

  @override
  String get swim => 'Yüzme';

  @override
  String get stretch => 'Esneme';

  @override
  String get yoga => 'Yoga';

  @override
  String get capoeira => 'Capoeira';

  @override
  String get other => 'Diğer';

  @override
  String setsOfReps(int set, int rep) {
    return '$set set $rep tekrar';
  }
}
