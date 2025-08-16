import 'package:appoeira/l10n/app_localizations.dart';
import 'package:appoeira/theme/theme.dart';
import 'package:flutter/material.dart';

class AchievementsList extends StatefulWidget {
  const AchievementsList({super.key});

  @override
  State<AchievementsList> createState() => _AchievementsListState();
}

class _AchievementsListState extends State<AchievementsList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.achievements),
      ),
      body: Center(
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}