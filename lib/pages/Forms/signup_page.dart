import 'package:flutter/material.dart';
import 'package:notifytuneplus/pages/Forms/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  // Array to store user data
  final List<Map<String, String>> users = [];

  // Controllers for input fields
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[10],
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title or Header
              Text(
                "Create Account to NotifyTune Plus",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: const Color(0xFF1D094D),
                ),
              ),
              Text(
                "Please enter your details to create account",
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 20),

              // Input Fields
              buildInputField(
                controller: firstNameController,
                hintText: 'First Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your First Name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              buildInputField(
                controller: secondNameController,
                hintText: 'Second Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your Second Name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              buildInputField(
                controller: emailController,
                hintText: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              buildInputField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters long";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              buildInputField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please confirm your password";
                  }
                  if (value != passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Sign up button
              SizedBox(
                width: 350,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Add user data to the array
                      users.add({
                        'firstName': firstNameController.text,
                        'secondName': secondNameController.text,
                        'email': emailController.text,
                        'password': passwordController.text,
                      });

                      // Clear input fields
                      firstNameController.clear();
                      secondNameController.clear();
                      emailController.clear();
                      passwordController.clear();
                      confirmPasswordController.clear();

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('User added successfully!')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1D094D),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                  child: const Text("Sign up"),
                ),
              ),
              const SizedBox(height: 20),

              // Already have account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(color: Color.fromARGB(255, 3, 15, 26)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

//   /// Helper method to build input fields
  Widget buildInputField({
    required TextEditingController controller,
    required String hintText,
    required String? Function(String?) validator,
    bool obscureText = false,
  }) {
    return SizedBox(
      width: 350,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
        ),
        validator: validator,
      ),
    );
  }
}
