import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'registration_screen.dart';
import 'login_screen.dart';

class LoginOptionsScreen extends StatefulWidget {
  const LoginOptionsScreen({super.key});

  @override
  State<LoginOptionsScreen> createState() => _LoginOptionsScreenState();
}

class _LoginOptionsScreenState extends State<LoginOptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login_img.png'),fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  "Shop Easy.",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  "Manage Easy.",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 10, left: 30, right: 30.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                        return const RegistrationScreen();
                      }));
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green),
                    ),
                    child: const Text(
                      "Sign up for Free",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    )),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 10, left: 30, right: 30.0),
                child: ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    child: const Text(
                      "Continue with Google",
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    )),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 10, left: 30, right: 30.0),
                child: ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                    ),
                    child: const Text(
                      "Continue with Facebook",
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    )),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 30),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) {
                      return const LoginScreen();
                    }));
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
