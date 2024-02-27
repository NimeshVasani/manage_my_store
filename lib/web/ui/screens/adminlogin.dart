import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_my_store/viewmodels/authentication/webauthviewmodel.dart';
import 'package:manage_my_store/viewmodels/firestore/webfirestoreviewmodel.dart';
import 'package:manage_my_store/web/ui/screens/adminmainscreen.dart';
import 'package:manage_my_store/web/ui/screens/adminregistration.dart';
import 'package:manage_my_store/web/ui/widgets/adminloginwidgets/loginappbar.dart';
import 'package:manage_my_store/web/ui/widgets/adminloginwidgets/loginheading.dart';
import 'package:provider/provider.dart';

import '../../../mobile/ui/widgets/customtext.dart';
import '../../../mobile/ui/widgets/loginscreenwidgets/emailTextField.dart';
import '../../../mobile/ui/widgets/loginscreenwidgets/passwordTextField.dart';
import '../../../utils/Resource.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  late WebAuthViewModel authViewModel;
  late WebFireStoreViewModel fireStoreViewModel;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    authViewModel = Provider.of<WebAuthViewModel>(context, listen: false);
    fireStoreViewModel =
        Provider.of<WebFireStoreViewModel>(context, listen: false);
    // Other initialization logic
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: loginAppBar('Manage Your Store\n With Satisfaction'),
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
                            loginHeading('Admin login'),
                            const Spacer(
                              flex: 1,
                            ),
                            emailTextField(emailController),
                            PasswordTextField(
                                textEditingController: passwordController,),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.only(
                                  bottom: 10, left: 30, right: 30.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    adminLogin();
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
                                child: InkWell(
                              onTap: () {
                                Navigator.push(context, CupertinoPageRoute(
                                    builder: (BuildContext context) {
                                  return const AdminRegistration();
                                }));
                              },
                              child: customTextView('New user? Register here.',
                                  16, FontWeight.w200, Colors.blue, 1),
                            )),
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

  adminLogin() async {
    final loginStatus =
    await authViewModel.loginAdmin(
        emailController.text,
        passwordController.text);
    switch (loginStatus.runtimeType) {
      case const (Success<User>):
        {
          final adminStatus =
          await fireStoreViewModel
              .checkUserOrAdmin(
              loginStatus.data!.uid);
          switch (adminStatus.runtimeType) {
            case const (Success<String>):
              {
                if (!mounted) return;
                Navigator.of(context)
                    .pushReplacement(
                    CupertinoPageRoute(
                        builder: (context) {
                          return const AdminMainScreen();
                        }));
                break;
              }
            default:
              {
                authViewModel.signOut();
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(
                  content: Text(
                    loginStatus.message
                        .toString(),
                    style: const TextStyle(
                        color: Colors.white54),
                  ),
                ));
              }
          }
        }

      default:
        {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(
            content: Text(
              loginStatus.message.toString(),
              style: const TextStyle(
                  color: Colors.white54),
            ),
          ));
        }
    }
  }
}

