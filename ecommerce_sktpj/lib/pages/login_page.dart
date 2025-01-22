import 'package:ecommerce_sktpj/pages/main_page.dart';
import 'package:ecommerce_sktpj/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4C54A5),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // Logo
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                child: Image.asset("images/logo_maggha.png"),
              ),

              // Input Email/Username
              _buildInputField(
                controller: _emailNameController,
                icon: Icons.person,
                hintText: 'Masukkan Username atau Email',
              ),
              const SizedBox(height: 10),

              // Input Password
              _buildInputField(
                controller: _passwordController,
                icon: Icons.lock,
                hintText: 'Masukkan Password Anda',
                obscureText: true,
              ),
              const SizedBox(height: 20),

              // Tautan
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      //fitur lupa password
                    },
                    child: const Text(
                      'Lupa Password?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                    },
                    child: const Text(
                      'Belum Punya Akun?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // Tombol Login
              InkWell(
                onTap: () async {
                  // Lakukan validasi login
                  bool isValid = await _validateLogin(
                    _emailNameController.text.trim(),
                    _passwordController.text.trim(),
                  );

                  if (isValid) {
                    // Simpan status login
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setBool('isLoggedIn', true);

                    // Navigasi ke halaman utama
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  } else {
                    // Tampilkan pesan kesalahan
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Username, Email, atau Password salah!'),
                      ),
                    );
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: const Text(
                    "Masuk",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi validasi login
  Future<bool> _validateLogin(String emailName, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString('username');
    String? storedEmail = prefs.getString('email');
    String? storedPassword = prefs.getString('password');

    if ((emailName == storedUsername || emailName == storedEmail) &&
        password == storedPassword) {
      return true;
    }
    return false;
  }

  // Widget field input
  Widget _buildInputField({
    required TextEditingController controller,
    required IconData icon,
    required String hintText,
    bool obscureText = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 55,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F9FD),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.blue),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
