import 'package:flutter/material.dart';
import 'Screens/Login-Signup/login_signup.dart';
import 'Screens/Login-Signup/register_screen.dart';
import 'Screens/Login-Signup/login.dart';
import 'Screens/Views/Screen1.dart';
import 'Screens/Views/Homepage.dart';
import 'Screens/Login-Signup/Profile_screen.dart';
import 'Screens/Views/medical_info.dart';
import 'Screens/Views/appointment.dart';
import 'Screens/Views/faqs.dart';
import 'Screens/Views/payment.dart';

class AppRoutes {
  static const String initial = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String homepage = '/homepage';
  static const String profile = '/profile';
  static const String medicalInfo = '/medical_info';
  static const String appointment = '/appointment';
  static const String faqs = '/faqs';
  static const String payment = '/payment';

  static Map<String, WidgetBuilder> routes = {
    initial: (context) => const Screen1(),
    login: (context) => const login_signup(),
    register: (context) => const Register(),
    homepage: (context) => const Homepage(),
    profile: (context) => const Profile_screen(),
    medicalInfo: (context) => const MedicalInfoScreen(),
    appointment: (context) => const appointment(),
    faqs: (context) => const FAQScreen(),
    payment: (context) => const PaymentMethodScreen(),
  };
}
