import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medical/Screens/Login-Signup/login_signup.dart';
import 'package:medical/Screens/Login-Signup/register_screen.dart';
import 'package:medical/Screens/Views/Screen1.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCekLpSO_N-qZsiGqsRekY0ggVHHcq6lbk",
      authDomain: "sustMedical.firebaseapp.com",
      projectId: "sustmedical-46753",
      storageBucket: "sustMedical.appspot.com",
      messagingSenderId: "501685871815",
      appId: "1:501685871815:android:e2109cfb0accd780b74ae2",
    ),
  );

  runApp(const Medics()); // ✅ You missed this!
}

class Medics extends StatelessWidget {
  const Medics({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
       return MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) => const Screen1(),
    '/login': (context) => const login_signup(),
    '/register': (context) => const Register(),
  },
);

      },
    );
  }
}
