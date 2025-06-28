import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical/Screens/Login-Signup/login.dart';
import 'package:medical/Screens/Widgets/Auth_text_field.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool agreeTerms = false;

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> signUp() async {
    final email = emailController.text.trim();
    final name = nameController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || name.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    if (!email.contains('@') || !email.contains('.')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid email")),
      );
      return;
    }
  bool isUpperCase = password.contains(RegExp(r'[A-Z]'));
    bool isLowerCase = password.contains(RegExp(r'[a-z]'));
    bool isSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    if (password.length < 6 || !isUpperCase || !isLowerCase || !isSpecialChar) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password should be at least 6 characters, contain uppercase, lowercase, and special characters")),
      );
      return;
    }

    if (!agreeTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please agree to the terms and conditions")),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseFirestore.instance.collection("users").doc(userCredential.user!.uid).set({
        'name': name,
        'email': email,
        'created_at': DateTime.now(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Account created successfully!")),
      );

      Navigator.pushReplacement(
        context,
        PageTransition(type: PageTransitionType.bottomToTop, child: const Login()),
      );
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'email-already-in-use':
          message = 'This email is already registered.';
          break;
        case 'invalid-email':
          message = 'The email address is invalid.';
          break;
        case 'weak-password':
          message = 'Password is too weak.';
          break;
        default:
          message = 'Authentication error: ${e.message}';
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true, 
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset("lib/icons/back2.png", height: 30),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Sign up",
          style: GoogleFonts.inter(
            color: Colors.black87,
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        toolbarHeight: 110,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Auth_text_field(
                controller: emailController,
                text: "Enter your email",
                icon: "lib/icons/email.png",
                isPassword: false,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              Auth_text_field(
                controller: nameController,
                text: "Enter your name",
                icon: "lib/icons/person.png",
                isPassword: false,
              ),
              const SizedBox(height: 10),
              Auth_text_field(
                controller: passwordController,
                text: "Enter your password",
                icon: "lib/icons/lock.png",
                isPassword: true,
              ),
              Row(
                children: [
                  Checkbox(
                    value: agreeTerms,
                    onChanged: (bool? value) {
                      setState(() {
                        agreeTerms = value ?? false;
                      });
                    },
                  ),
                  Flexible(
                    child: Text(
                      "I agree to the terms and conditions",
                      style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.black87),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLoading ? null : signUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 3, 190, 150),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          "Create Account",
                          style: GoogleFonts.poppins(fontSize: 18.sp, color: Colors.white),
                        ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.black87),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(type: PageTransitionType.bottomToTop, child: const Login()),
                      );
                    },
                    child: Text(
                      "Sign in",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: const Color.fromARGB(255, 3, 190, 150),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
