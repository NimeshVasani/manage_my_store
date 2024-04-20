import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_my_store/mobile/ui/widgets/login_screen_widgets/email_text_field.dart';
import 'package:manage_my_store/mobile/ui/widgets/login_screen_widgets/password_text_field.dart';
import 'package:manage_my_store/model/web/store.dart';
import 'package:manage_my_store/model/web/store_owner.dart';
import 'package:manage_my_store/viewmodels/firestore/web_fire_store_view_model.dart';
import 'package:manage_my_store/web/ui/screens/admin_login.dart';
import 'package:manage_my_store/web/ui/widgets/admin_registration_widgets/admin_name_text_field.dart';
import 'package:provider/provider.dart';
import '../../../utils/Resource.dart';
import '../../../viewmodels/authentication/web_auth_view_model.dart';
import '../widgets/admin_login_widgets/login_app_bar.dart';
import '../widgets/admin_login_widgets/login_heading.dart';

class AdminRegistration extends StatefulWidget {
  const AdminRegistration({super.key});

  @override
  State<AdminRegistration> createState() => _AdminRegistrationState();
}

class _AdminRegistrationState extends State<AdminRegistration> {
  late WebAuthViewModel authViewModel;
  late WebFireStoreViewModel fireStoreViewModel;
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
    fireStoreViewModel =
        Provider.of<WebFireStoreViewModel>(context, listen: false);

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
                                    final registrationStatus =
                                        await authViewModel.registerAdmin(
                                            nameController.text,
                                            emailController.text,
                                            passwordController1.text);
                                    switch (registrationStatus.runtimeType) {
                                      case const (Success<User?>):
                                        {
                                          final storeStatus =
                                              await fireStoreViewModel
                                                  .addStoreIntoStoreList(
                                                      FirebaseStore(
                                                          FirebaseStoreOwner(
                                                            nameController.text,
                                                            emailController
                                                                .text,
                                                            '',
                                                          ),
                                                          storeNameController
                                                              .text,
                                                          storeLocationController
                                                              .text,
                                                          []));

                                          switch (storeStatus.runtimeType) {
                                            case const (Success<bool>):
                                              {
                                                if (!mounted) return;
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        CupertinoPageRoute(
                                                            builder: (context) {
                                                  return const AdminLoginScreen();
                                                }));
                                                break;
                                              }
                                            default:
                                              {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: Text(
                                                    registrationStatus.message
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
                                              registrationStatus.message
                                                  .toString(),
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
                                    "Register store",
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
