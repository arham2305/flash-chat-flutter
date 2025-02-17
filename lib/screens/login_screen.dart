import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen' ;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value ;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: "Enter your Email"),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value ;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: "Enter your Password"),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(title: "Login",colours: Colors.blueAccent,onPressed: () async{
                setState(() {
                  showSpinner = true ;
                });
                final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                try {
                  if (user != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                  setState(() {
                    showSpinner = false ;
                  });
                }
                catch(e){
                  print(e);
                }
              },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
