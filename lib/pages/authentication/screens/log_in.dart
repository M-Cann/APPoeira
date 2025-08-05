import 'package:appoeira/common_functions/developer_tools.dart';
import 'package:appoeira/l10n/app_localizations.dart';
import 'package:appoeira/pages/authentication/screens/sign_up.dart';
import 'package:appoeira/pages/home_page/screens/home.dart';
import 'package:appoeira/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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

  bool buttonActive() => emailController.text.isNotEmpty && passwordController.text.isNotEmpty;

  @override
  void initState() {
    for(int i = 0; i < AppLocalizations.supportedLocales.length; i++){
      languageDropdownList.add(DropdownMenuEntry(value: i, label: AppLocalizations.supportedLocales[i].languageCode));
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted){
          currentLanguageIndex = AppLocalizations.supportedLocales.indexWhere((element) => element.languageCode == AppLocalizations.of(context)!.localeName);
        }
      },
    );
    super.initState();
  }

  void logIn(){
    Logger.green.log('Giriş Tamam');
    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
