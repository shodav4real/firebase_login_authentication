// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/views/widgets/draw_circle_image.dart';
import '../widgets/text_field_inputs.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:login_page/views/widgets/text_buttons.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  //const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //keys
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  //text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.clear();
    _passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Login Page (Grp 23)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DrawCircleImage(),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 5),
                child: Text(
                  'Welcome',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                'Login to your acccount to continue',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Theme.of(context).primaryColor),
              ),
              TextFieldInputs(
                'johndoe@gmail.com',
                Icons.person,
                _emailController,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFieldInputs(
                    'Password', Icons.lock_open_outlined, _passwordController),
              ),
              /* InkWell(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 15, right: 10, bottom: 20),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                    textAlign: TextAlign.end,
                  ),
                ),
                onTap: () {},
              ), */
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 30, 5, 20),
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  onPressed: () async {
                    _auth.signInWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text);
                    await Navigator.of(context).pushReplacementNamed('/home');
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context).pushNamed('/signup'),
                      child: Text(
                        '  Sign Up',
                        style: TextStyle(color: Colors.green, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              /* Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  drawLine(height: 1, width: 80),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'OR',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  drawLine(height: 1, width: 80),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: textButtons('assets/googleIcon.png'),
                  ),
                  textButtons('assets/facebookIcon.png'),
                ],
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: drawLine(height: 1, width: 100),
                  ),
                ],
              ), */
            ],
          ),
        ),
      ),
    );
  }
}
