import 'package:appoeira/l10n/app_localizations.dart';
import 'package:appoeira/pages/calendar/screens/calendar.dart';
import 'package:appoeira/pages/workouts/screens/workouts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DrawerMenu> drawerList = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        drawerList.add(DrawerMenu(AppLocalizations.of(context)!.workouts, WorkoutsList()));
        drawerList.add(DrawerMenu(AppLocalizations.of(context)!.calendar, Calendar()));
      });
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.homePage),
      ),
      body: Center(
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
      drawer: Drawer(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => drawerList[index].route),),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Text(drawerList[index].title),
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
          itemCount: drawerList.length,
        ),
      ),
    );
  }
}

class DrawerMenu{
  DrawerMenu(this.title, this.route);

  String title;
  dynamic route;
}