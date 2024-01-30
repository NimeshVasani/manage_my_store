import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_my_store/web/ui/widgets/adminloginwidgets/loginappbar.dart';
import 'package:manage_my_store/web/ui/widgets/adminloginwidgets/loginheading.dart';

import '../../../mobile/ui/screens/registrationscreen.dart';
import '../../../mobile/ui/widgets/customtext.dart';
import '../../../mobile/ui/widgets/loginscreenwidgets/emailTextField.dart';
import '../../../mobile/ui/widgets/loginscreenwidgets/passwordTextField.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: loginAppBar(),
      backgroundColor: Colors.white,
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/web/web_back.jpg'),
                  fit: BoxFit.cover)),
          child: Center(
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(

                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Card(
                        clipBehavior: Clip.hardEdge,
                        elevation: 2.0,
                        surfaceTintColor: Colors.transparent,
                        color: Colors.white,
                        child: SizedBox(
                          width: 400,
                          height: 400,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              loginHeading(),
                              const Spacer(
                                flex: 1,
                              ),
                              emailTextField(emailController),
                              PasswordTextField(
                                  textEditingController: passwordController),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.only(
                                    bottom: 10, left: 30, right: 30.0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          CupertinoPageRoute(builder: (context) {
                                        return const RegistrationScreen();
                                      }));
                                    },
                                    style: const ButtonStyle(
                                      backgroundColor:
                                          MaterialStatePropertyAll(Colors.green),
                                    ),
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.0),
                                    )),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Center(
                                  child: customTextView('Forgot password?', 16,
                                      FontWeight.w200, Colors.blue, 1)),
                              const SizedBox(
                                height: 10,
                              ),
                              Center(
                                  child: customTextView('New user? Register here.', 16,
                                      FontWeight.w200, Colors.blue, 1)),
                              const Spacer(
                                flex: 2,
                              ),
                            ],
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
