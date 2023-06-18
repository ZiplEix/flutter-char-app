import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../widgets/auth_widgets/auth_auth_methode.dart';
import '../widgets/auth_widgets/auth_submit_button.dart';
import '../widgets/auth_widgets/auth_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
    required this.onTap,
  });

  final void Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailCointroller = TextEditingController();
  final TextEditingController passwordCointroller = TextEditingController();
  final TextEditingController confirmPasswordCointroller =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                // Logo
                const Icon(
                  Icons.message,
                  size: 80,
                ),
                const SizedBox(height: 50),

                // welcome back
                Text(
                  "Let's create an account",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),

                // username password
                AuthTextField(
                  controller: emailCointroller,
                  hintText: "Email",
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 10),
                AuthTextField(
                  controller: passwordCointroller,
                  hintText: "Password",
                  password: true,
                ),
                const SizedBox(height: 10),
                AuthTextField(
                  controller: confirmPasswordCointroller,
                  hintText: "Comfirm Password",
                  password: true,
                ),
                const SizedBox(height: 50),

                //sign in Button
                AuthSubmitButton(
                  text: "Register",
                  onTap: () => AuthService().noServices.registerUser(
                        context,
                        emailCointroller.text,
                        passwordCointroller.text,
                        confirmPasswordCointroller.text,
                      ),
                ),
                const SizedBox(height: 50),

                // continue with
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Or continue with",
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),

                // google and apple
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AuthAuthWith(
                      onTap: () {},
                      imagePath: "assets/apple.png",
                    ),
                    // SizedBox(width: 100),
                    AuthAuthWith(
                      onTap: () =>
                          AuthService().google.signInWithGoogle(context),
                      imagePath: "assets/google.png",
                    ),
                  ],
                ),
                const SizedBox(height: 50),

                // not members
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Login Now",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
