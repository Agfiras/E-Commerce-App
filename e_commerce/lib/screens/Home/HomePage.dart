import 'package:e_commerce/screens/Sign_in/sign_in-screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'components/Body.dart';

class HomePage extends StatelessWidget {
  final GoogleSignInAccount user;
  const HomePage({Key? key, required this.user}) : super(key: key);
  static String routeName = "/Home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('You welcome'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            },
            child: Text('Logout'),
          ),
        ],
      ),
      body: HomeBody(user: user),
    );
  }
}
