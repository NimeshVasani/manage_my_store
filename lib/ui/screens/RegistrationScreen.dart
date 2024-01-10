import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:manage_my_store/model/User.dart';
import 'package:manage_my_store/utils/Resource.dart';
import 'package:manage_my_store/utils/Resource.dart';
import 'package:provider/provider.dart';
import '../../utils/Resource.dart';
import '../../viewmodels/authentication/authviewmodel.dart';
import '../widgets/loginscreenwidgets/emailTextField.dart';
import '../widgets/loginscreenwidgets/passwordTextField.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late AuthViewModel authViewModel;

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
                image: AssetImage('assets/images/login_img_3.png'),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max, // Take up all vertical space
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
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
              const Spacer(),
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
              emailTextField(),
              const PasswordTextField(),
              const PasswordTextField(),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.only(bottom: 50, left: 30, right: 30.0),
                child: ElevatedButton(
                    onPressed: () async {
                      BuildContext currentContext = context;
                      Resources<FirebaseUser?> firebaseUser =
                          await authViewModel.registerWithEmailAndPassword(
                              "nims4", "nims4@gmail.com", "123456");
                      switch(firebaseUser.data){
                        case Success :
                          if (!context.mounted) return;
                          Navigator.pop(currentContext);
                        case Error :
                          SnackBar(content: Text(firebaseUser.message.toString()),);
                        case Loading :
                          SnackBar(content: Text('Loading..'),);
                      }

                      if (firebaseUser.data?.email != null) {

                      }
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
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of dependencies registered with GetIt here
    GetIt.I.reset();
    super.dispose();
  }
}
