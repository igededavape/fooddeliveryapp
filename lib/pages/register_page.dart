import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{
// text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.lock_open_rounded,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),

            // message app slogan
            Text(
              "Let's create an acount for you",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 25),

            // email textfield
            // email textfield
            MyTextfield(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ), 

            const SizedBox(height: 10),

            // password textfield
              MyTextfield(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ), 

            const SizedBox(height: 10),

            // confirm password textfield
              MyTextfield(
              controller: confirmPasswordController,
              hintText: "confirm Password",
              obscureText: true,
            ), 

            const SizedBox(height: 25),
            // sign up button
            MyButton(
              text: "sign up",
             onTap: () {},
             ),

             const SizedBox(height: 25),
             
            // already have an account? login here
            Row(
  mainAxisAlignment: MainAxisAlignment.center, // Menambahkan ini untuk perataan horizontal di tengah
  children: [
    Text(
      "already have an account?",
      style: TextStyle(
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
    ),
    const SizedBox(width: 4),
    GestureDetector(
      onTap: widget.onTap,
      child: Text(
        "login now",
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ],
),

          ],
        ),
      ),
    );
  }
}