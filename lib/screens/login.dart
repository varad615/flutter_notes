import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes/controller/google_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Image.asset('assets/images/login.png', width: 300),
          SizedBox(
            height: 50,
          ),
          OutlinedButton.icon(
            onPressed: () {
              signInWithGoogle(context);
            },
            label: Text(
              "Login With Google",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            icon: SvgPicture.asset('assets/images/google2.svg', width: 20),
          )
        ],
      ),
    ));
  }
}
