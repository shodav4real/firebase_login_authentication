import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/views/widgets/text_field_inputs.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  static const routeName = '/signup';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
              const CircleAvatar(
                backgroundImage: AssetImage('assets/main.png'),
                radius: 75,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15, bottom: 5),
                child: Text(
                  'Signup',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                'Enter your Details',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12, color: Theme.of(context).primaryColor),
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
                    _auth.createUserWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text);
                    await Navigator.of(context).pushReplacementNamed('/login');
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: const Text(
                      'Signup',
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
                    const Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context).pushNamed('/login'),
                      child: const Text(
                        '  Login',
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
