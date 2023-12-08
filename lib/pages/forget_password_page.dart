import 'package:flutter/material.dart';
import 'package:foodorderpasha/components/my_button.dart';
import 'package:foodorderpasha/components/my_textfield.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({super.key});

  final emailController = TextEditingController();

  void resetPassword() {
    // Parola sıfırlama işlevi burada
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF906AFE),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () {
            Navigator.of(context).pop(); // Bu, önceki sayfaya geri dönmeyi sağlar
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
                  'Forgot Password?',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 25),
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                SizedBox(height: 25),
                MyButton(
                    onTap: resetPassword,
                    buttonText: 'Reset Password'
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Remember your password?',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(); // Bu, giriş sayfasına geri döner
                      },
                      child: Text(
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
