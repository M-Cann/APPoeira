import 'package:appoeira/l10n/app_localizations.dart';
import 'package:appoeira/theme/theme.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.calendar),
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