import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_food_delivery/components/my_textfield.dart';
import 'package:flutter_food_delivery/components/my_button.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //login method
  void login() {
    /*

    fill out authentication here.

    */

    // navigate to home page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:(context) => const HomePage(),
        ),
    );
  }


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
              "Food Delivery App",
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

            // sign up in button
            MyButton(
              text: "sign in",
             onTap: login,
             ),

             const SizedBox(height: 25),
             
            // not a member? register now
            Center(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Not a member?",
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      const SizedBox(width: 4),
      GestureDetector(
        onTap: widget.onTap,
        child: Text(
          "Register now",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  ),
)

          ],
        ),
      ),
    );
  }
}
