import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../Home/HomePage.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _isChecked = false;

  Future login(BuildContext context) async {
    if (email.text == "" || password.text == "") {
      Fluttertoast.showToast(
        msg: "Both fields cannot be blank",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,
      );
    } else {
      GohomePage(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          BuildEmailText(),
          SizedBox(height: 20),
          BuildPasswordText(),
          SizedBox(height: 20),
          Row(
            children: [
              checkBox(),
              const Spacer(),
              const Text('Forgot Password',
                  style: TextStyle(decoration: TextDecoration.underline)),
            ],
          ),
          SizedBox(height: 20),
          Button(context),
        ],
      ),
    );
  }

  Row checkBox() {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      SizedBox(
          height: 24.0,
          width: 24.0,
          child: Theme(
            data:
                ThemeData(unselectedWidgetColor: Color(0xff00C8E8) // Your color
                    ),
            child: Checkbox(
                activeColor: Color(0xff00C8E8),
                value: _isChecked,
                onChanged: _handleRemeberme),
          )),
      SizedBox(width: 10.0),
      Text("Remember Me",
          style: TextStyle(
              color: Color(0xff646464), fontSize: 12, fontFamily: 'Muli'))
    ]);
  }

  FlatButton Button(BuildContext context) {
    return FlatButton(
      minWidth: 350,
      height: 50,
      color: kPrimaryLightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: () {
        login(context);
      },
      child: const Text(
        'Continue',
        style: TextStyle(
          fontFamily: 'Muli',
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }

  TextFormField BuildPasswordText() {
    return TextFormField(
      obscureText: true,
      controller: password,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: 'Enter your password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0, getProportionateScreenWidth(20),
              getProportionateScreenWidth(20), getProportionateScreenWidth(20)),
          child: const Icon(Icons.password, color: kTextColor),
        ),
      ),
    );
  }

  TextFormField BuildEmailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: email,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: 'Enter your email',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0, getProportionateScreenWidth(20),
              getProportionateScreenWidth(20), getProportionateScreenWidth(20)),
          child: const Icon(Icons.email_outlined, color: kTextColor),
        ),
      ),
    );
  }

  void _handleRemeberme(bool? value) {
    print("Handle Rember Me");
    _isChecked = value!;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', email.text);
        prefs.setString('password', password.text);
      },
    );
    setState(() {
      _isChecked = value;
    });
  }
}

void GohomePage(context) => Navigator.pushNamed(context, HomePage.routeName);
