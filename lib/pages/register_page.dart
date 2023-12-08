import 'package:flutter/material.dart';
import 'package:foodorderpasha/components/my_button.dart';
import 'package:foodorderpasha/components/my_textfield.dart';
import 'package:foodorderpasha/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordController2 = TextEditingController(); // İkinci parola alanı için yeni bir controller
  bool isPasswordVisible = false;
  bool isPasswordVisible2 = false; // İkinci parola alanı için görünürlük durumu

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void togglePasswordVisibility2() {
    setState(() {
      isPasswordVisible2 = !isPasswordVisible2; // İkinci parola alanı için görünürlük durumunu değiştirin
    });
  }

  void registerUser() {
    // Kullanıcı kaydı yapma işlevi burada
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF906AFE),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent, // AppBar'ın arka planını şeffaf yapar
        elevation: 0, // AppBar'ın gölgesini kaldırır
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Image.asset("assets/images/quiz.png", width: 200, height: 145),
                SizedBox(height: 50),
                Text(
                  'Create an Account',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 25),
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: !isPasswordVisible,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: IconButton(
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: togglePasswordVisibility,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    MyTextField(
                      controller: passwordController2,
                      hintText: 'Password Again',
                      obscureText: !isPasswordVisible2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: IconButton(
                        icon: Icon(
                          isPasswordVisible2
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: togglePasswordVisibility2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                MyButton(
                    onTap: registerUser,
                    buttonText: 'Sign In'
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 4),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

