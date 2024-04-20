import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:manage_my_store/model/user.dart';
import 'package:manage_my_store/utils/Resource.dart';
import 'package:manage_my_store/viewmodels/firestore/mobile_firestore_view_model.dart';
import 'package:provider/provider.dart';
import '../../../viewmodels/authentication/mobile_auth_view_model.dart';
import '../widgets/login_screen_widgets/app_bar.dart';
import '../widgets/login_screen_widgets/email_text_field.dart';
import '../widgets/login_screen_widgets/name_text_field.dart';
import '../widgets/login_screen_widgets/password_text_field.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late MobileAuthViewModel authViewModel;
  late MobileFireStoreViewModel fireStoreViewModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    authViewModel = Provider.of<MobileAuthViewModel>(context, listen: false);
    fireStoreViewModel =
        Provider.of<MobileFireStoreViewModel>(context, listen: false);
    // Other initialization logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.black,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/login_img_3.png'),
                  fit: BoxFit.cover)),
          child: ListView(
            shrinkWrap: false,
            children: [
              customAppBar(context),
              const SizedBox(
                height: 300,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  "Find your Favorite,",
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
                  "Stuff.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              nameTextField(nameController),
              emailTextField(emailController),
              PasswordTextField(
                textEditingController: passwordController,
              ),
              PasswordTextField(
                textEditingController: passwordController2,
              ),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.only(bottom: 50, left: 30, right: 30.0),
                child: ElevatedButton(
                    onPressed: () async {

                      Resources<User?> firebaseUser =
                          await authViewModel.registerWithEmailAndPassword(
                              nameController.text,
                              emailController.text,
                              passwordController.text);
                      switch (firebaseUser.runtimeType) {
                        case const (Success<User?>):
                          Resources<bool> fireStoreValue =
                              await fireStoreViewModel.addUserIntoUserList(
                                  FirebaseUser(nameController.text,
                                      firebaseUser.data!.email!, null));
                          switch (fireStoreValue.runtimeType) {
                            case const (Success<bool>):
                              {
                                if (!context.mounted) return;
                                Navigator.pop(context);
                                break;
                              }
                            case const (Error<bool>):
                              {
                                if (!context.mounted) return;

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content:
                                      Text(fireStoreValue.message.toString()),
                                ));
                                break;
                              }
                            case const (Loading<bool?>):
                              {
                                if (!context.mounted) return;

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('Loading..'),
                                ));
                                break;
                              }
                          }

                        case const (Error<User?>):
                          {
                            if (!context.mounted) return;

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(firebaseUser.message.toString()),
                            ));
                            break;
                          }
                        case const (Loading<User?>):
                          {
                            if (!context.mounted) return;

                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Loading..'),
                            ));
                            break;
                          }
                      }

                      if (firebaseUser.data?.email != null) {}
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green),
                    ),
                    child: const Text(
                      "Create Account",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    )),
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    // Dispose of dependencies registered with GetIt here
    GetIt.I.reset();
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    passwordController2.dispose();
    super.dispose();
  }
}
