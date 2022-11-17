import 'package:flutter/material.dart';
import '../presentation/pages/admin/home_admin_page.dart';

import '../presentation/pages/user/finder_form_page.dart';
import '../presentation/pages/user/home_page.dart';
import '../presentation/pages/user/login_page.dart';
import '../presentation/pages/user/seeker_form_page.dart';

const String loginPage = "login-page";
const String homePage = "home-page";
const String finderFormPage = "finder-form-page";
const String seekerFormPage = "seeker-form-page";

const String homeAdminPage = "home-admin-page";

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homeAdminPage:
      return MaterialPageRoute(
        builder: (context) => const HomeAdminPage(),
      );
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
