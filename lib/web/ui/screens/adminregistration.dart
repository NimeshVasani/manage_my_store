import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_my_store/mobile/ui/screens/loginscreen.dart';
import 'package:manage_my_store/mobile/ui/widgets/loginscreenwidgets/emailTextField.dart';
import 'package:manage_my_store/mobile/ui/widgets/loginscreenwidgets/passwordTextField.dart';
import 'package:manage_my_store/web/ui/screens/adminmainscreen.dart';
import 'package:manage_my_store/web/ui/widgets/adminloginwidgets/loginheading.dart';
import 'package:manage_my_store/web/ui/widgets/adminregistrationwidgets/adminnametextfield.dart';
import 'package:provider/provider.dart';

import '../../../utils/Resource.dart';
import '../../../viewmodels/authentication/webauthviewmodel.dart';
import '../widgets/adminloginwidgets/loginappbar.dart';

class AdminRegistration extends StatefulWidget {
  const AdminRegistration({super.key});

  @override
  State<AdminRegistration> createState() => _AdminRegistrationState();
}

class _AdminRegistrationState extends State<AdminRegistration> {
  late WebAuthViewModel authViewModel;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController storeNameController = TextEditingController();
  TextEditingController storeLocationController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    authViewModel = Provider.of<WebAuthViewModel>(context, listen: false);

    // Other initialization logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: loginAppBar('Register your Store\n Start growing today.'),
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
                    const SizedBox(
                      height: 50,
                    ),
                    Card(
                      clipBehavior: Clip.hardEdge,
                      elevation: 2.0,
                      surfaceTintColor: Colors.transparent,
                      color: Colors.white,
                      child: SizedBox(
                        width: 600,
                        height: 600,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            loginHeading('Store Registration'),
                            const SizedBox(
                              height: 20,
                            ),
                            adminNameTextField(nameController,
                                'Enter your full name', Icons.man_2),
                            adminNameTextField(storeNameController,
                                'Enter Store name', Icons.store),
                            adminNameTextField(
                                storeLocationController,
                                'Enter Store address',
                                Icons.add_location_rounded),
                            emailTextField(emailController),
                            PasswordTextField(
                                textEditingController: passwordController1),
                            PasswordTextField(
                                textEditingController: passwordController2),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.only(
                                  bottom: 10, left: 30, right: 30.0),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    final loginStatus =
                                        await authViewModel.loginAdmin(
                                            emailController.text,
                                            passwordController1.text);
                                    switch (loginStatus.runtimeType) {
                                      case const (Success<User?>):
                                        {
                                          if (!mounted) return;

                                          Navigator.of(context).pushReplacement(
                                              CupertinoPageRoute(
                                                  builder: (context) {
                                            return const LoginScreen();
                                          }));
                                          break;
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
                                  },
                                  style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.green),
                                  ),
                                  child: const Text(
                                    "Register",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
