import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @logIn.
  ///
  /// In tr, this message translates to:
  /// **'Giriş Yap'**
  String get logIn;

  /// No description provided for @signUp.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt Ol'**
  String get signUp;

  /// No description provided for @email.
  ///
  /// In tr, this message translates to:
  /// **'E-mail'**
  String get email;

  /// No description provided for @password.
  ///
  /// In tr, this message translates to:
  /// **'Şifre'**
  String get password;

  /// No description provided for @cancel.
  ///
  /// In tr, this message translates to:
  /// **'İptal'**
  String get cancel;

  /// No description provided for @clear.
  ///
  /// In tr, this message translates to:
  /// **'Temizle'**
  String get clear;

  /// No description provided for @add.
  ///
  /// In tr, this message translates to:
  /// **'Ekle'**
  String get add;

  /// No description provided for @dontHaveAnAccount.
  ///
  /// In tr, this message translates to:
  /// **'Hesabın yok mu?'**
  String get dontHaveAnAccount;

  /// No description provided for @doYouHaveAnAccount.
  ///
  /// In tr, this message translates to:
  /// **'Hesabın var mı?'**
  String get doYouHaveAnAccount;

  /// No description provided for @homePage.
  ///
  /// In tr, this message translates to:
  /// **'Ana Sayfa'**
  String get homePage;

  /// No description provided for @search.
  ///
  /// In tr, this message translates to:
  /// **'Ara'**
  String get search;

  /// No description provided for @workouts.
  ///
  /// In tr, this message translates to:
  /// **'Antrenmanlar'**
  String get workouts;

  /// No description provided for @workout.
  ///
  /// In tr, this message translates to:
  /// **'Antrenman'**
  String get workout;

  /// No description provided for @workoutDescription.
  ///
  /// In tr, this message translates to:
  /// **'Antrenman Açıklaması'**
  String get workoutDescription;

  /// No description provided for @targetedWorkoutDuration.
  ///
  /// In tr, this message translates to:
  /// **'Hedeflenen Antrenman Süresi'**
  String get targetedWorkoutDuration;

  /// No description provided for @calendar.
  ///
  /// In tr, this message translates to:
  /// **'Takvim'**
  String get calendar;

  /// No description provided for @achievements.
  ///
  /// In tr, this message translates to:
  /// **'Başarımlar'**
  String get achievements;

  /// No description provided for @profile.
  ///
  /// In tr, this message translates to:
  /// **'Profil'**
  String get profile;

  /// No description provided for @signOut.
  ///
  /// In tr, this message translates to:
  /// **'Çıkış Yap'**
  String get signOut;

  /// No description provided for @settings.
  ///
  /// In tr, this message translates to:
  /// **'Ayarlar'**
  String get settings;

  /// No description provided for @workoutSettings.
  ///
  /// In tr, this message translates to:
  /// **'Antrenman Ayarları'**
  String get workoutSettings;

  /// No description provided for @countdownTime.
  ///
  /// In tr, this message translates to:
  /// **'Geri Sayım Süresi'**
  String get countdownTime;

  /// No description provided for @setsTheTimeYouAreGivenToPrepareWhenStartingAWorkout.
  ///
  /// In tr, this message translates to:
  /// **'Antrenmana başlarken hazırlanmanız için verilen süreyi ayarlar.'**
  String get setsTheTimeYouAreGivenToPrepareWhenStartingAWorkout;

  /// No description provided for @themeSettings.
  ///
  /// In tr, this message translates to:
  /// **'Tema Ayarları'**
  String get themeSettings;

  /// No description provided for @startWorkout.
  ///
  /// In tr, this message translates to:
  /// **'Antrenmana Başla'**
  String get startWorkout;

  /// No description provided for @addWorkout.
  ///
  /// In tr, this message translates to:
  /// **'Antrenman Ekle'**
  String get addWorkout;

  /// No description provided for @addWorkoutSecond.
  ///
  /// In tr, this message translates to:
  /// **'Antrenmanı Ekle'**
  String get addWorkoutSecond;

  /// No description provided for @addMovement.
  ///
  /// In tr, this message translates to:
  /// **'Hareket Ekle'**
  String get addMovement;

  /// No description provided for @addSet.
  ///
  /// In tr, this message translates to:
  /// **'Set Ekle'**
  String get addSet;

  /// No description provided for @addRest.
  ///
  /// In tr, this message translates to:
  /// **'Dinlenme Ekle'**
  String get addRest;

  /// No description provided for @workoutContent.
  ///
  /// In tr, this message translates to:
  /// **'Antrenman İçeriği'**
  String get workoutContent;

  /// No description provided for @workoutType.
  ///
  /// In tr, this message translates to:
  /// **'Antrenman Tipi'**
  String get workoutType;

  /// No description provided for @repetitive.
  ///
  /// In tr, this message translates to:
  /// **'Tekrarlı'**
  String get repetitive;

  /// No description provided for @periodical.
  ///
  /// In tr, this message translates to:
  /// **'Süreli'**
  String get periodical;

  /// No description provided for @duration.
  ///
  /// In tr, this message translates to:
  /// **'Süre'**
  String get duration;

  /// No description provided for @addWorkoutProgram.
  ///
  /// In tr, this message translates to:
  /// **'Antrenman Programı Ekle'**
  String get addWorkoutProgram;

  /// No description provided for @workoutProgram.
  ///
  /// In tr, this message translates to:
  /// **'Antrenman Programı'**
  String get workoutProgram;

  /// No description provided for @youVeNeverTrainedBeforeClickAboveToStartTrainingNow.
  ///
  /// In tr, this message translates to:
  /// **'Hiç antrenman yapmamışsın.\nHemen yukarıya tıklayarak antrenmana başla.'**
  String get youVeNeverTrainedBeforeClickAboveToStartTrainingNow;

  /// No description provided for @start.
  ///
  /// In tr, this message translates to:
  /// **'Başlat'**
  String get start;

  /// No description provided for @select.
  ///
  /// In tr, this message translates to:
  /// **'Seçiniz'**
  String get select;

  /// No description provided for @enterText.
  ///
  /// In tr, this message translates to:
  /// **'Metin giriniz'**
  String get enterText;

  /// No description provided for @enterNumber.
  ///
  /// In tr, this message translates to:
  /// **'Sayı giriniz'**
  String get enterNumber;

  /// No description provided for @optional.
  ///
  /// In tr, this message translates to:
  /// **'(Opsiyonel)'**
  String get optional;

  /// No description provided for @noMovementInformationFound.
  ///
  /// In tr, this message translates to:
  /// **'Hareket bilgisi bulunamadı.'**
  String get noMovementInformationFound;

  /// No description provided for @enterTheMovementName.
  ///
  /// In tr, this message translates to:
  /// **'Hareket adını giriniz'**
  String get enterTheMovementName;

  /// No description provided for @numberOfSets.
  ///
  /// In tr, this message translates to:
  /// **'Set Sayısı'**
  String get numberOfSets;

  /// No description provided for @numberOfRepetitions.
  ///
  /// In tr, this message translates to:
  /// **'Tekrar Sayısı'**
  String get numberOfRepetitions;

  /// No description provided for @weight.
  ///
  /// In tr, this message translates to:
  /// **'Ağırlık'**
  String get weight;

  /// No description provided for @weightType.
  ///
  /// In tr, this message translates to:
  /// **'Ağırlık Türü'**
  String get weightType;

  /// No description provided for @run.
  ///
  /// In tr, this message translates to:
  /// **'Koşu'**
  String get run;

  /// No description provided for @walk.
  ///
  /// In tr, this message translates to:
  /// **'Yürüyüş'**
  String get walk;

  /// No description provided for @calisthenics.
  ///
  /// In tr, this message translates to:
  /// **'Calisthenics'**
  String get calisthenics;

  /// No description provided for @cardio.
  ///
  /// In tr, this message translates to:
  /// **'Kardiyo'**
  String get cardio;

  /// No description provided for @swim.
  ///
  /// In tr, this message translates to:
  /// **'Yüzme'**
  String get swim;

  /// No description provided for @stretch.
  ///
  /// In tr, this message translates to:
  /// **'Esneme'**
  String get stretch;

  /// No description provided for @yoga.
  ///
  /// In tr, this message translates to:
  /// **'Yoga'**
  String get yoga;

  /// No description provided for @capoeira.
  ///
  /// In tr, this message translates to:
  /// **'Capoeira'**
  String get capoeira;

  /// No description provided for @no.
  ///
  /// In tr, this message translates to:
  /// **'Yok'**
  String get no;

  /// No description provided for @other.
  ///
  /// In tr, this message translates to:
  /// **'Diğer'**
  String get other;

  /// No description provided for @dumbbell.
  ///
  /// In tr, this message translates to:
  /// **'Dambıl'**
  String get dumbbell;

  /// No description provided for @barbell.
  ///
  /// In tr, this message translates to:
  /// **'Halter'**
  String get barbell;

  /// No description provided for @weightVest.
  ///
  /// In tr, this message translates to:
  /// **'Ağırlık Yeleği'**
  String get weightVest;

  /// No description provided for @wristWeights.
  ///
  /// In tr, this message translates to:
  /// **'El Bilek Ağırlığı'**
  String get wristWeights;

  /// No description provided for @ankleWeights.
  ///
  /// In tr, this message translates to:
  /// **'Ayak Bilek Ağırlığı'**
  String get ankleWeights;

  /// No description provided for @wristAndAnkleWeights.
  ///
  /// In tr, this message translates to:
  /// **'El ve Ayak Bilek Ağırlığı'**
  String get wristAndAnkleWeights;

  /// No description provided for @repsWithCount.
  ///
  /// In tr, this message translates to:
  /// **'{rep} tekrar'**
  String repsWithCount(Object rep);

  /// No description provided for @setsOfReps.
  ///
  /// In tr, this message translates to:
  /// **'{set} set {rep} tekrar'**
  String setsOfReps(int set, int rep);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
