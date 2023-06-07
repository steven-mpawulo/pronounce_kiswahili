import 'package:flutter/material.dart';
import 'package:pronounce_kiswahili/components/button.dart';
import 'package:pronounce_kiswahili/screens/login_screen.dart';
import 'package:provider/provider.dart';
import '../components/text_form_field.dart';
import 'package:pronounce_kiswahili/services/auth_service.dart';
import 'package:pronounce_kiswahili/screens/recording_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pronounce_kiswahili/screens/account_created.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isLoading = false;
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
 


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
                  "Sign Up",
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
                    )
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
                        hintText: "Full Name",
                        controller: _fullName,
                        forPassword: false
                      ),
                      const SizedBox(height: 8.0),
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
                      const SizedBox(height: 8.0),
                      MyTextFormField(
                        obscurePassword: true,
                        icon: Icons.remove_red_eye_outlined,
                        hintText: "Confirm Password",
                        controller: _confirmPassword,
                        forPassword: true,
                      ),
                      const SizedBox(height: 16.0),
                      SizedBox(
                        child: _isLoading? SpinKitWave(color: Colors.greenAccent, size: 50.0) :  MyButton(buttonText: "Sign Up", onButtonPressed: () async{
                          setState((){
                _isLoading = true;
              });
                         if(_email.text == null && _password.text == null){
                              const snackBar = SnackBar(
                                  content: Text('Please provide your email and password'),
                                );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                            else{
                              await Provider.of<AuthService>(context, listen:false).signUpWithEmailAndPassword(_email.text, _password.text).then((value){
                                setState((){
                                _isLoading = false;
                              });
                                if(value != null){
                                 Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return const AccountCreatedScreen();
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
                      ),
                      
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
