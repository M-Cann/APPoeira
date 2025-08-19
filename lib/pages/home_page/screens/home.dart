import 'package:appoeira/common_functions/developer_tools.dart';
import 'package:appoeira/l10n/app_localizations.dart';
import 'package:appoeira/pages/achievements/screens/achievements_list.dart';
import 'package:appoeira/pages/authentication/screens/log_in.dart';
import 'package:appoeira/pages/authentication/services/authentication_services.dart';
import 'package:appoeira/pages/calendar/screens/calendar.dart';
import 'package:appoeira/pages/profile/screens/profile.dart';
import 'package:appoeira/pages/settings/screens/settings.dart';
import 'package:appoeira/pages/workouts/screens/workouts_list.dart';
import 'package:appoeira/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  List<DrawerMenu> drawerList = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        drawerList.add(DrawerMenu(AppLocalizations.of(context)!.workouts, WorkoutsList()));
        drawerList.add(DrawerMenu(AppLocalizations.of(context)!.calendar, Calendar()));
        drawerList.add(DrawerMenu(AppLocalizations.of(context)!.achievements, AchievementsList()));
        drawerList.add(DrawerMenu(AppLocalizations.of(context)!.profile, Profile()));
        drawerList.add(DrawerMenu(AppLocalizations.of(context)!.settings, Settings()));
      });
    },);
    super.initState();
  }

  Future<void> signOut() async {
    try{
      await Authentication().signOut();
      Logger.green.log('Çıkış Yapıldı');
      Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()),);
    } on FirebaseAuthException catch(e) {
      Logger.red.log('Çıkış Başarısız ${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.homePage),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          children: <Widget>[
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.search,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  borderSide: BorderSide(width: 1.w, color: Colors.blueGrey),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  borderSide: BorderSide(width: 1.w, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
            Padding(
              padding: EdgeInsets.only(bottom: 24.h),
              child: TextButton(
                style: TextButton.styleFrom(
                  overlayColor: Colors.transparent,
                ),
                onPressed: () {
                  signOut();
                },
                child: Text(AppLocalizations.of(context)!.signOut,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
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