import 'package:ecommerce_sktpj/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4C54A5),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                child: Image.asset("images/logo_maggha.png", height: 150),
              ),

              // Input Username
              _buildInputField(
                controller: _usernameController,
                icon: Icons.person,
                hintText: "Masukkan Username Anda",
              ),
              const SizedBox(height: 20),

              // Input Email
              _buildInputField(
                controller: _emailController,
                icon: Icons.email,
                hintText: "Masukkan Email Anda",
              ),
              const SizedBox(height: 20),

              // Input Password
              _buildInputField(
                controller: _passwordController,
                icon: Icons.lock,
                hintText: "Masukkan Password Anda",
                obscureText: true,
              ),
              const SizedBox(height: 20),

              // Tautan Login jika sudah memiliki akun
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: const Text(
                  'Sudah Punya Akun? Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Tombol Daftar
              InkWell(
                onTap: () async {
                  await _register(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 55,
                  width: double.infinity,
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
                    "Daftar",
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

  // Fungsi untuk menyimpan data register ke Shared Preferences
  Future<void> _register(BuildContext context) async {
    String username = _usernameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text;

    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap isi semua data!'),
        ),
      );
      return;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('email', email);
    await prefs.setString('password', password);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Registrasi Berhasil!'),
      ),
    );

    // Arahkan ke halaman login
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  // Fungsi untuk membangun field input
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
