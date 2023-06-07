import 'package:flutter/material.dart';
import 'package:pronounce_kiswahili/components/button.dart';
import 'package:pronounce_kiswahili/screens/forgot_password.dart';
import 'package:pronounce_kiswahili/screens/recording_screen.dart';
import 'package:pronounce_kiswahili/screens/sign_up.dart';
import 'package:pronounce_kiswahili/services/auth_service.dart';
import '../components/text_form_field.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
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
                  "Log In",
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
                      const SizedBox(height: 8.0),
                      MyTextFormField(
                        obscurePassword: true,
                        icon: Icons.remove_red_eye_outlined,
                        hintText: "Password",
                        controller: _password,
                        forPassword: true
                      ),
                      const SizedBox(height: 16.0),
                      MyButton(
                          buttonText: "Log In",
                          onButtonPressed: () async{
                            if(_email.text == null && _password.text == null){
                              const snackBar = SnackBar(
                                  content: Text('Please provide your email and password'),
                                );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                            else{
                              await Provider.of<AuthService>(context, listen:false).signInWithEmailAndPassword(_email.text, _password.text).then((value){
                                if(value != null){
                                 Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return const RecordingScreen();
                            }));
                                }
                                else {
                                  const snackBar = SnackBar(
                                  content: Text("Some error occured while signing in"),
                                );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                }
                              });
                            }
                           
                          }),
                      const SizedBox(
                        height: 16.0,
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
                              "Don't have an account? Sign up",
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
                                return const ResetPasswordScreen();
                              }));
                            },
                            child: const Text(
                              "Forgot your password?",
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
