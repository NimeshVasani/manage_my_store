import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../model/User.dart';
import '../../utils/Resource.dart';
import '../../viewmodels/authentication/authviewmodel.dart';
import '../widgets/loginscreenwidgets/emailTextField.dart';
import '../widgets/loginscreenwidgets/passwordTextField.dart';
import 'mainscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authViewModel = GetIt.instance.get<AuthViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 10,
          ),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: const Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.blue,
                  ),
                  Text(
                    " Back",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                  ),
                ]),
          ),
        ),
        leadingWidth: 100,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                child: Image.asset('assets/images/music_logo.png'),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  "Sounds of Joy,",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  "Everywhere.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  emailTextField(),
                  const PasswordTextField(),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                        bottom: 50, left: 30, right: 30.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          final loginStatus =
                              await authViewModel.loginWithEmailAndPassword(
                                  "nims1@hmail.com", "123456");
                          switch (loginStatus.runtimeType) {
                            case const (Success<FirebaseUser?>):
                              {
                                if (!mounted) return;

                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const MainScreen();
                                }));
                                break;
                              }

                            default:
                              {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text(
                                    'This is a Snackbar',
                                    style: TextStyle(color: Colors.white54),
                                  ),
                                ));
                              }
                          }
                        },
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of dependencies registered with GetIt here
    GetIt.I.unregister<AuthViewModel>();
    super.dispose();
  }
}
