import 'package:appoeira/common_functions/developer_tools.dart';
import 'package:appoeira/l10n/app_localizations.dart';
import 'package:appoeira/pages/authentication/screens/log_in.dart';
import 'package:appoeira/pages/authentication/services/authentication_services.dart';
import 'package:appoeira/pages/home_page/screens/home.dart';
import 'package:appoeira/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool buttonActive() => emailController.text.isNotEmpty && passwordController.text.isNotEmpty;

  Future<void> signUp() async {
    await Authentication().signUp(emailController.text, passwordController.text, () {
      Logger.green.log('Kayıt Tamam');
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.signUp),
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
                  signUp();
                }else{
                  Logger.red.log('Text Fieldlarda Hata Var');
                }
              },
              child: Text(AppLocalizations.of(context)!.signUp),
            ),
            SizedBox(height: 24.h,),
            TextButton(
              style: TextButton.styleFrom(
                overlayColor: Colors.transparent,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()),);
              },
              child: Text(AppLocalizations.of(context)!.doYouHaveAnAccount),
            ),
          ],
        ),
      ),
    );
  }
}
