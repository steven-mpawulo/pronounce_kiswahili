import 'package:flutter/material.dart';
import 'package:pronounce_kiswahili/components/button.dart';
import 'package:pronounce_kiswahili/screens/login_screen.dart';
import 'package:pronounce_kiswahili/screens/recording_screen.dart';
import 'package:pronounce_kiswahili/screens/sign_up.dart';
import '../components/text_form_field.dart';


class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Reset Password",
                  style: TextStyle(
                    fontSize: 32.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      ""
                      "Learn how to pronounce Kiswahili.",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      "It's fun.",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextFormField(
                        obscurePassword: false,
                        icon: Icons.remove_red_eye_outlined,
                        hintText: "Email",
                        controller: _email,
                        forPassword: false,
                      ),
                      const SizedBox(height: 16.0),
                      MyButton(
                          buttonText: "Submit",
                          onButtonPressed: () {
                             // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return const RecordingScreen(); }));
                          },),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Center(
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return const LogInScreen();
                              }));
                            },
                            child: const Text(
                              "Already have an account? Log in",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          SizedBox(
                            width: 140.0,
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.black,
                            ),
                          ),
                          Text("or"),
                          SizedBox(
                            width: 140.0,
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Center(
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return const SignUpScreen();
                              }));
                            },
                            child: const Text(
                              "Don't have an account? Sign up?",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
