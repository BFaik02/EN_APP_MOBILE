// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:formation_app/screen/api.dart';
import 'package:formation_app/screen/home_page.dart';
import 'package:formation_app/style/app_colors.dart';
import 'package:formation_app/style/app_icons.dart';
import 'package:formation_app/style/app_style.dart';

import '../style/responsive_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //Fonction pour effectuer la connexion

  void login(String email, String password) async {
    var data = {
      'email': emailController.text,
      'password': passwordController.text,
    };

    var res = await CallApi().postData(data, 'login');
    var body = json.decode(res.body);
    if (email != "" && password != "") {
      var data = jsonDecode(res.body.toString());
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  HomePage()),
      );
      print(data['token']); // Affiche le token reçu dans la réponse
      print('Login successfully'); // Affiche un message de succès
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ResponsiveWidget.isSmallScreen(context)
                ? const SizedBox()
                : Expanded(
                    child: Container(
                      height: height,
                      color: AppColors.mainBlueColor,
                      child: Center(
                        child: Text(
                          'Ecole Numerique',
                          style: ralewayStyle.copyWith(
                              fontSize: 48.0,
                              color: AppColors.withColor,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ),
            Expanded(
              child: Container(
                height: height,
                margin: EdgeInsets.symmetric(
                    horizontal: ResponsiveWidget.isSmallScreen(context)
                        ? height * 0.03
                        : height * 0.012),
                color: AppColors.backColor,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.2,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: '',
                            style: ralewayStyle.copyWith(
                                fontSize: 25.0,
                                color: AppColors.blueDarkColor,
                                fontWeight: FontWeight.normal),
                          ),
                          TextSpan(
                            text: 'Bienvenu',
                            style: ralewayStyle.copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.blueDarkColor,
                              fontSize: 25.0,
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(
                        'Bienvenu sur la platform Ecole Numerique',
                        style: ralewayStyle.copyWith(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 7.0),
                        child: Text(
                          'Email',
                          style: ralewayStyle.copyWith(
                            fontSize: 14.0,
                            color: AppColors.blueDarkColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Container(
                        height: 40.0,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppColors.withColor,
                        ),
                        child: TextFormField(
                          controller: emailController,
                          style: ralewayStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.blueDarkColor,
                            fontSize: 14.0,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: Image.asset(AppIcons.emailIcon),
                              ),
                              contentPadding: const EdgeInsets.only(top: 5.0),
                              hintText: 'Entrer votre Email',
                              hintStyle: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.blueDarkColor.withOpacity(0.5),
                                fontSize: 12.0,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 7.0),
                        child: Text(
                          'Password',
                          style: ralewayStyle.copyWith(
                            fontSize: 14.0,
                            color: AppColors.blueDarkColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Container(
                        height: 40.0,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppColors.withColor,
                        ),
                        child: TextFormField(
                          controller: passwordController,
                          style: ralewayStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.blueDarkColor,
                            fontSize: 14.0,
                          ),
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Image.asset(AppIcons.eyeIcon),
                              ),
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: Image.asset(AppIcons.lockIcon),
                              ),
                              contentPadding: const EdgeInsets.only(top: 5.0),
                              hintText: 'Entrer votre mot de passe',
                              hintStyle: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.blueDarkColor.withOpacity(0.5),
                                fontSize: 12.0,
                              )),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Mot de passe oublier?',
                              style: ralewayStyle.copyWith(
                                  fontSize: 12.0,
                                  color: AppColors.mainBlueColor,
                                  fontWeight: FontWeight.w600),
                            )),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Appelle la fonction de connexion avec les données fournies
                          login(emailController.text.toString(),
                              passwordController.text.toString());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100.0, vertical: 18.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: AppColors.mainBlueColor,
                          ),
                          child: Text(
                            'Connexion',
                            style: ralewayStyle.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.withColor,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
