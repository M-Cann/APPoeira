import 'package:appoeira/firebase_options.dart';
import 'package:appoeira/l10n/app_localizations.dart';
import 'package:appoeira/pages/authentication/screens/log_in.dart';
import 'package:appoeira/providers/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  LocalizationsProvider localizationsProvider = LocalizationsProvider();
  await localizationsProvider.fetchLocale();
  runApp(MyApp(localizationsProvider: localizationsProvider,));
}

class MyApp extends StatelessWidget {
  LocalizationsProvider? localizationsProvider;
  MyApp({super.key, required this.localizationsProvider});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => localizationsProvider,
      child: Consumer<LocalizationsProvider>(builder: (context, value, child) {
        return MaterialApp(
          title: 'APPoeira',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          localeResolutionCallback: (locale, supportedLocales) {
            if (supportedLocales.contains(locale)) {
              return locale;
            }
            return null;
          },
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          builder: (context, child) {
            ScreenUtil.init(context, designSize: Size(360, 800));
            return child!;
          },
          debugShowCheckedModeBanner: false,
          locale: value.locale,
          home: LogIn(),
        );
      },),
    );
  }
}
