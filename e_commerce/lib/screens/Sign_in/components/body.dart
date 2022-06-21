import 'package:e_commerce/Api/googleSignin.dart';
import 'package:e_commerce/screens/Home/HomePage.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import '../../../components/socal_card.dart';
import 'signin_form.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  Map? _userData;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight = 0.04),
                Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  "Sign in  with your email and password  \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 60),
                SignForm(),
                SizedBox(height: 130),
                SizedBox(height: SizeConfig.screenHeight = 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: 'assets/icons/google.svg',
                      press: () {
                        StartSignin(context);
                      },
                    ),
                    SocalCard(
                      icon: 'assets/icons/facebook.svg',
                      press: () {},
                    ),
                    SocalCard(
                      icon: 'assets/icons/twitter.svg',
                      press: () {
                        Fblogin();
                      },
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future Fblogin() async {
    final result =
        await FacebookAuth.i.login(permissions: ["public_profile", "email"]);

    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.i.getUserData(
        fields: "email,name",
      );
    }
  }

  Future StartSignin(context) async {
    final user = await GoogleSigninApi.login();
    if (user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Signin Failed')));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomePage(user: user),
      ));
    }
  }
}
