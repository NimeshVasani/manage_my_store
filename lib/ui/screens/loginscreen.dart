import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../model/user.dart';
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
  late AuthViewModel authViewModel;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    authViewModel = Provider.of<AuthViewModel>(context, listen: false);

    // Other initialization logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login_img_2.png'),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppBar(
                backgroundColor: Colors.black38,
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
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ]),
                  ),
                ),
                leadingWidth: 100,
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  "We can Manage,",
                  style: TextStyle(
                      color: Colors.limeAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  "Together.",
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
                  emailTextField(emailController),
                  PasswordTextField(
                    textEditingController: passwordController,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                        bottom: 50, left: 30, right: 30.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          final loginStatus =
                              await authViewModel.loginWithEmailAndPassword(
                                  emailController.text,
                                  passwordController.text);
                          switch (loginStatus.runtimeType) {
                            case const (Success<User?>):
                              {
                                if (!mounted) return;

                                Navigator.of(context).pushReplacement(
                                    CupertinoPageRoute(builder: (context) {
                                  return const MainScreen();
                                }));
                                break;
                              }

                            default:
                              {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    loginStatus.message.toString(),
                                    style:
                                        const TextStyle(color: Colors.white54),
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
