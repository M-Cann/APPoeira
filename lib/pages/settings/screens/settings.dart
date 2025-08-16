import 'package:appoeira/l10n/app_localizations.dart';
import 'package:appoeira/pages/settings/screens/theme_settings.dart';
import 'package:appoeira/pages/settings/screens/workout_settings.dart';
import 'package:appoeira/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<SettingItem> settingsList = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        settingsList.add(SettingItem(AppLocalizations.of(context)!.workoutSettings, Icon(Icons.add), WorkoutSettings()));
        settingsList.add(SettingItem(AppLocalizations.of(context)!.themeSettings, Icon(Icons.add), ThemeSettings()));
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
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => settingsList[index].route),),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: containerDecoration,
              child: Text(settingsList[index].title),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 8.h,);
        },
        itemCount: settingsList.length
      ),
    );
  }
}

class SettingItem{
  SettingItem(this.title, this.icon, this.route);

  String title;
  Widget icon;
  dynamic route;
}