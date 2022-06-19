import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
    required this.user,
  }) : super(key: key);

  final GoogleSignInAccount user;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blueGrey.shade900,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Profile',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 32,
          ),
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(user.photoUrl!),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Name: ' + user.displayName!,
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Email: ' + user.email,
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ],
      ),
    );
  }
}
