import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../Sign_in/sign_in-screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "ECHRINI",
              body: "Welcome to ECHRINI.Let's shop!",
              image: buildImage('assets/images/Online_shopping.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'ECHRINI',
              body: 'we help people connect with stores in Tunisia',
              image: buildImage('assets/images/shopping_app.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'ECHRINI',
              body: 'Our goal is to make your daily shopping easy',
              image: buildImage('assets/images/Online_groceries.png'),
              footer: FlatButton(
                minWidth: 300,
                height: 50,
                color: kPrimaryLightColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                onPressed: () => goHome(context),
                child: const Text('Continue',
                    style: TextStyle(
                        fontFamily: 'Muli',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ),
              decoration: getPageDecoration(),
            ),
          ],
          showDoneButton: false,
          showSkipButton: false,
          showNextButton: false,
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: const Color(0xffffffff),
        ),
      );

  void goHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => SignInScreen()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: const Color(0xFFBDBDBD),
        activeColor: Colors.lightGreen,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(
            fontFamily: 'Muli',
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: Colors.lightGreen),
        bodyTextStyle: TextStyle(
            fontFamily: 'Muli', fontSize: 20, fontWeight: FontWeight.w300),
      );
}
