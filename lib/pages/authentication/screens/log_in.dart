import 'package:appoeira/common_functions/developer_tools.dart';
import 'package:appoeira/l10n/app_localizations.dart';
import 'package:appoeira/pages/authentication/screens/sign_up.dart';
import 'package:appoeira/pages/authentication/services/authentication_services.dart';
import 'package:appoeira/pages/home_page/screens/home.dart';
import 'package:appoeira/providers/providers.dart';
import 'package:appoeira/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<DropdownMenuEntry> languageDropdownList = [];
  int currentLanguageIndex = 0;
  dynamic prefs;

  bool buttonActive() => emailController.text.isNotEmpty && passwordController.text.isNotEmpty;

  @override
  void initState() {
    for(int i = 0; i < AppLocalizations.supportedLocales.length; i++){
      languageDropdownList.add(DropdownMenuEntry(value: i, label: AppLocalizations.supportedLocales[i].languageCode));
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted){
        setState(() {
          currentLanguageIndex = AppLocalizations.supportedLocales.indexWhere((element) => element.languageCode == AppLocalizations.of(context)!.localeName);
        });
      }
    },);
    asyncInit();
    super.initState();
  }

  Future<void> asyncInit() async {
    prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey('token')){
      logInWithToken();
    }
  }

  Future<void> logIn() async {
    await Authentication().logIn(emailController.text, passwordController.text, (tokenResponse) {
      if(tokenResponse != null && tokenResponse.isNotEmpty){
        Logger.green.log('Giriş Tamam');
        prefs.setString('token', tokenResponse);
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
      }else{
        Logger.red.log('Token Boş Geldi');
      }
    },);
  }

  Future<void> logInWithToken() async {
    await Authentication().logInWithToken(prefs.getString('token'), () {
      Logger.green.log('Token İle Giriş Tamam');
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.logIn),
        actions: [
          DropdownMenu(
            dropdownMenuEntries: languageDropdownList,
            initialSelection: currentLanguageIndex,
            onSelected: (value) {
              context.read<LocalizationsProvider>().setLocale(AppLocalizations.supportedLocales[value]);
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.email,
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
            SizedBox(height: 8.h,),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.password,
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
            SizedBox(height: 16.h,),
            ElevatedButton(
              onPressed: () {
                if(buttonActive()){
                  logIn();
                }else{
                  Logger.red.log('Text Fieldlarda Hata Var');
                }
              },
              child: Text(AppLocalizations.of(context)!.logIn),
            ),
            SizedBox(height: 24.h,),
            TextButton(
              style: TextButton.styleFrom(
                overlayColor: Colors.transparent,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()),);
              },
              child: Text(AppLocalizations.of(context)!.dontHaveAnAccount),
            ),
          ],
        ),
      ),
    );
  }
}
