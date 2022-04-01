import 'package:flutter/material.dart';
// import 'package:flutter_auth/Screens/Login/login_screen.dart';
// import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
// import 'package:flutter_auth/Screens/Welcome/components/background.dart';
// import 'package:flutter_auth/components/rounded_button.dart';
// import 'package:flutter_auth/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test2/components/rounded_button.dart';
import 'package:test2/screens/home_page.dart';
import 'package:test2/screens/login/components/background.dart';
import 'package:test2/utils/onboarding_font_style.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO EDU",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Container(
                height: 48,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: (){
                    nextScreen(context);
                  },
                  child: const Text("Login"),
                ),
              ),
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return SignUpScreen();
                //     },
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
  void nextScreen(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomePage();
        },
      ),
    );
  }
}

