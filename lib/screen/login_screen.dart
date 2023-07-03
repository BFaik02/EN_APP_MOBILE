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
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  // Function to perform login
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
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      print(data['token']); // Display the received token in the response
      print('Login successfully'); // Display a success message
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 35,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.backColor,
      ),
      backgroundColor: AppColors.backColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                Center(
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'EN',
                          style: ralewayStyle.copyWith(
                            fontSize: ResponsiveWidget.isSmallScreen(context)
                                ? 46.0
                                : 65.0,
                            color: AppColors.blueDarkColor,
                            fontWeight: FontWeight.w900,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.homeColor,
                            decorationThickness: 2.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'BIENVENUE !',
                          style: ralewayStyle.copyWith(
                            fontWeight: FontWeight.w900,
                            color: AppColors.homeColor,
                            fontSize: ResponsiveWidget.isSmallScreen(context)
                                ? 30.0
                                : 45.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.07,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7.0),
                  child: Text(
                    'Email',
                    style: ralewayStyle.copyWith(
                      fontSize:
                          ResponsiveWidget.isSmallScreen(context) ? 14.0 : 20.0,
                      color: AppColors.blueDarkColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Container(
                  height: 60.0,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.withColor,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      controller: emailController,
                      style: ralewayStyle.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.blueDarkColor,
                        fontSize: ResponsiveWidget.isSmallScreen(context)
                            ? 12.0
                            : 22.0,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.only(top: 5.0),
                        hintStyle: ralewayStyle.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.blueDarkColor.withOpacity(0.5),
                          fontSize: ResponsiveWidget.isSmallScreen(context)
                              ? 10.0
                              : 12.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7.0),
                  child: Text(
                    'Mot de passe',
                    style: ralewayStyle.copyWith(
                      fontSize:
                          ResponsiveWidget.isSmallScreen(context) ? 14.0 : 20.0,
                      color: AppColors.blueDarkColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Container(
                  height: 60.0,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.withColor,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      controller: passwordController,
                      style: ralewayStyle.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.blueDarkColor,
                        fontSize: ResponsiveWidget.isSmallScreen(context)
                            ? 12.0
                            : 22.0,
                      ),
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Image.asset(AppIcons.eyeIcon),
                        ),
                        contentPadding: const EdgeInsets.only(top: 5.0),
                        hintStyle: ralewayStyle.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.blueDarkColor.withOpacity(0.5),
                          fontSize: ResponsiveWidget.isSmallScreen(context)
                              ? 10.0
                              : 12.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (bool? value) {
                            setState(() {
                              rememberMe = value!;
                            });
                          },
                        ),
                        Text(
                          'Se rappeler de moi',
                          style: ralewayStyle.copyWith(
                            fontSize: ResponsiveWidget.isSmallScreen(context)
                                ? 12.0
                                : 16.0,
                            color: AppColors.blueDarkColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Mot de passe oublié?',
                        style: ralewayStyle.copyWith(
                          fontSize: ResponsiveWidget.isSmallScreen(context)
                              ? 12.0
                              : 16.0,
                          color: AppColors.homeColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    // Call the login function with provided data
                    login(
                      emailController.text.toString(),
                      passwordController.text.toString(),
                    );
                  },
                  child: Container(
                    width: width,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 100.0,
                      vertical: 14.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColors.homeColor,
                    ),
                    child: Center(
                      child: Text(
                        'CONNEXION',
                        style: ralewayStyle.copyWith(
                          fontWeight: FontWeight.w900,
                          color: AppColors.withColor,
                          fontSize: ResponsiveWidget.isSmallScreen(context)
                              ? 20.0
                              : 36.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Vous n\'avez pas de compte?',
                            style: ralewayStyle.copyWith(
                              fontSize: ResponsiveWidget.isSmallScreen(context)
                                  ? 12.0
                                  : 16.0,
                              color: AppColors.blueDarkColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Inscrivez-vous',
                        style: ralewayStyle.copyWith(
                          fontSize: ResponsiveWidget.isSmallScreen(context)
                              ? 12.0
                              : 16.0,
                          color: AppColors.homeColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
