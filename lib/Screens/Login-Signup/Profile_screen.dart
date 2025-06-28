import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Profile_screen extends StatefulWidget {
  const Profile_screen({super.key});

  @override
  State<Profile_screen> createState() => _Profile_screenState();
}

class _Profile_screenState extends State<Profile_screen> {
  Uint8List? _avatarBytes;

  // Controller for editable name
  final TextEditingController _nameController =
      TextEditingController(text: "Jawadun Noor");

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
      maxHeight: 600,
      imageQuality: 80,
    );
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() => _avatarBytes = bytes);
    }
  }

  void _navigate(String route) {
    Navigator.pushNamed(context, route);
  }

  void _logout() {
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 226, 215),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: _avatarBytes != null
                              ? MemoryImage(_avatarBytes!)
                              : const AssetImage("lib/icons/avatar.png")
                                  as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1, color: Colors.white),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Editable name text field
              SizedBox(
                width: 60.w,
                child: TextField(
                  controller: _nameController,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  cursorColor: Colors.white,
                ),
              ),

              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoBox("lib/icons/callories.png", "Calories", "103lbs"),
                    Container(height: 50, width: 1, color: Colors.white),
                    _buildInfoBox("lib/icons/weight.png", "Weight", "756cal"),
                    Container(height: 50, width: 1, color: Colors.white),
                    _buildInfoBox("lib/icons/heart.png", "Heart rate", "215bpm"),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      _buildListItem(
                        icon: "lib/icons/heart2.png",
                        title: "My Medical Info",
                        onTap: () => _navigate('/medical_info'),
                      ),
                      _divider(),
                      _buildListItem(
                        icon: "lib/icons/appoint.png",
                        title: "Appointment",
                        onTap: () => _navigate('/appointment'),
                      ),
                      _divider(),
                      _buildListItem(
                        icon: "lib/icons/Chat.png",
                        title: "FAQs",
                        onTap: () => _navigate('/faqs'),
                      ),
                      _divider(),
                      _buildListItem(
                        icon: "lib/icons/pay.png",
                        title: "Payment Method",
                        onTap: () => _navigate('/payment'),
                      ),
                      _divider(),
                      _buildListItem(
                        icon: "lib/icons/logout.png",
                        title: "Log out",
                        textColor: Colors.red,
                        onTap: _logout,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBox(String icon, String title, String value) {
    return SizedBox(
      height: 9.h,
      width: 25.w,
      child: Column(
        children: [
          Image.asset(icon, height: 4.h, width: 8.w),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 245, 243, 243),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem({
    required String icon,
    required String title,
    required VoidCallback onTap,
    Color textColor = Colors.black87,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: Row(
          children: [
            Image.asset(icon, height: 30, width: 30),
            const SizedBox(width: 15),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Divider(),
    );
  }
}
