import 'package:ecommerce_sktpj/data/user_data.dart';
import 'package:ecommerce_sktpj/models/user.dart';
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
      backgroundColor: Color(0xFF4C54A5),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // Logo dengan jarak yang lebih dekat
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                child: Image.asset("images/logo_maggha.png"),
              ),

              // Kolom input Username dengan ikon profil dan teks di tengah
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 55,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F9FD),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _emailNameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.blue),
                    hintText: 'Masukkan Username atau email',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    border: InputBorder.none,
                  ),
                ),
              ),

              SizedBox(height: 10), // Mengurangi jarak antar elemen

              // Kolom input Password dengan ikon kunci dan teks di tengah
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 55,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F9FD),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.blue),
                    hintText: 'Masukkan Password Anda',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    border: InputBorder.none,
                  ),
                ),
              ),

              // Row to align Forgot Password and Don't Have an Account links
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute the space between the two links
                  children: [
                    // Forgot Password link (aligned left)
                    TextButton(
                      onPressed: () {
                        // Tambahkan fungsionalitas untuk forgot password
                      },
                      child: Text(
                        'Lupa Password?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    
                    // Don't have an account link (aligned right)
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                      },
                      child: Text(
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
              ),

              SizedBox(height: 50), // Jarak sedikit di bawah tombol login

              // Tombol Login
              InkWell(
                onTap: () async {
                  String emailName = _emailNameController.text;
                  String password = _passwordController.text;

                  if (validateLogin(emailName, password)){
                    SharedPreferences prefs = 
                      await SharedPreferences.getInstance();
                      await prefs.setBool('isLoggedIn', true);
                      await prefs.setString('email', emailName);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Email atau Password Salah'),
                      ),
                    );
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 15),
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
                  child: Text(
                    "Masuk",
                    style: TextStyle(
                      fontSize: 25,
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
  bool validateLogin(String email, String password) {
    for(User user in userList) {
      if((user.email == email && user.password == password) || (user.name == email && user.password == password)) {
        return true;
      }
    }
    return false;
  }
}

