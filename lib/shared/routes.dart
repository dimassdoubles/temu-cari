import 'package:flutter/material.dart';
import 'package:temu_cari/presentation/pages/finder_form_page.dart';
import 'package:temu_cari/presentation/pages/seeker_form_page.dart';
import '../presentation/pages/home_page.dart';
import '../presentation/pages/login_page.dart';

const String loginPage = "login-page";
const String homePage = "home-page";
const String finderFormPage = "finder-form-page";
const String seekerFormPage = "seeker-form-page";

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case seekerFormPage:
      return MaterialPageRoute(
        builder: (context) => const SeekerFormPage(),
      );
    case finderFormPage:
      return MaterialPageRoute(
        builder: (context) => const FinderFormPage(),
      );
    case homePage:
      return MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
    case loginPage:
      return MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );
    default:
      throw ("This route name doesn't exist");
  }
}
