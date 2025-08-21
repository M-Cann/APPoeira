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
  String get cancel => 'İptal';

  @override
  String get clear => 'Temizle';

  @override
  String get add => 'Ekle';

  @override
  String get dontHaveAnAccount => 'Hesabın yok mu?';

  @override
  String get doYouHaveAnAccount => 'Hesabın var mı?';

  @override
  String get homePage => 'Ana Sayfa';

  @override
  String get search => 'Ara';

  @override
  String get workouts => 'Antrenmanlar';

  @override
  String get workout => 'Antrenman';

  @override
  String get workoutDescription => 'Antrenman Açıklaması';

  @override
  String get targetedWorkoutDuration => 'Hedeflenen Antrenman Süresi';

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
  String get addWorkoutSecond => 'Antrenmanı Ekle';

  @override
  String get addMovement => 'Hareket Ekle';

  @override
  String get addSet => 'Set Ekle';

  @override
  String get addRest => 'Dinlenme Ekle';

  @override
  String get workoutContent => 'Antrenman İçeriği';

  @override
  String get workoutType => 'Antrenman Tipi';

  @override
  String get repetitive => 'Tekrarlı';

  @override
  String get periodical => 'Süreli';

  @override
  String get duration => 'Süre';

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
  String get select => 'Seçiniz';

  @override
  String get enterText => 'Metin giriniz';

  @override
  String get enterNumber => 'Sayı giriniz';

  @override
  String get optional => '(Opsiyonel)';

  @override
  String get noMovementInformationFound => 'Hareket bilgisi bulunamadı.';

  @override
  String get enterTheMovementName => 'Hareket adını giriniz';

  @override
  String get numberOfSets => 'Set Sayısı';

  @override
  String get numberOfRepetitions => 'Tekrar Sayısı';

  @override
  String get weight => 'Ağırlık';

  @override
  String get weightType => 'Ağırlık Türü';

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
  String get no => 'Yok';

  @override
  String get other => 'Diğer';

  @override
  String get dumbbell => 'Dambıl';

  @override
  String get barbell => 'Halter';

  @override
  String get weightVest => 'Ağırlık Yeleği';

  @override
  String get wristWeights => 'El Bilek Ağırlığı';

  @override
  String get ankleWeights => 'Ayak Bilek Ağırlığı';

  @override
  String get wristAndAnkleWeights => 'El ve Ayak Bilek Ağırlığı';

  @override
  String repsWithCount(Object rep) {
    return '$rep tekrar';
  }

  @override
  String setsOfReps(int set, int rep) {
    return '$set set $rep tekrar';
  }
}
