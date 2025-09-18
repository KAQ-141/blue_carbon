import 'investor_screen.dart';
import 'package:flutter/material.dart';
import 'main.dart'; // Import your existing HomePage file
import 'upload_screen.dart';
import 'NGO_screen.dart';
import 'admin_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


void handleLogin() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Hard-coded check for demo purposes
    if (email == "Helookitty123" && password == "admin123") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AdminApp()),
      );
    } else if (email == "NgoUser" && password == "ngo123") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NGOApp()),
      );
    } else if (email == "Investor" && password == "invest123") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid credentials")),
      );
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
  'assets/logo.png', // your image path
  width: 80,
  height: 80,
  fit: BoxFit.contain, // keeps aspect ratio
),

                const SizedBox(height: 16),
                const Text(
                  "Carbon Chain Registry",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // Email / Username field
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email / Username",
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Password field
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Login button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: handleLogin,
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 18),
                  ),
                ),

                const SizedBox(height: 16),

                // Forgot password link
                TextButton(
                  onPressed: () {
                    // Handle forgot password here if needed
                  },
                  child: const Text("Forgot Password?"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
