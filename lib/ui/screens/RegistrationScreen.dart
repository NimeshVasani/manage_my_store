import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../viewmodels/authentication/authviewmodel.dart';
import '../widgets/loginscreenwidgets/emailTextField.dart';
import '../widgets/loginscreenwidgets/passwordTextField.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max, // Take up all vertical space

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
                  const PasswordTextField(),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                        bottom: 50, left: 30, right: 30.0),
                    child: ElevatedButton(
                        onPressed: () {
                          authViewModel.registerWithEmailAndPassword(
                              "nims1", "nims1@hmail.com", "123456");
                        },
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green),
                        ),
                        child: const Text(
                          "Create Account",
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
    GetIt.I.reset();
    super.dispose();
  }
}
