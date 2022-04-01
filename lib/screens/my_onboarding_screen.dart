import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test2/screens/home_page.dart';
import 'package:test2/screens/login/welcome_screen.dart';
import 'package:test2/screens/login_screen.dart';
import 'package:test2/screens/onboarding_screen.dart';

class OnBoardingAnimationExample extends StatefulWidget {
  const OnBoardingAnimationExample({Key? key}) : super(key: key);

  @override
  State<OnBoardingAnimationExample> createState() =>
      _OnBoardingAnimationExampleState();
}

class _OnBoardingAnimationExampleState
    extends State<OnBoardingAnimationExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.9),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: OnBoardingAnimation(
          pages: [
            const _GetCardsContent(
              image: 'assets/images/image_1.jpg',
              cardContent:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            ),
            const _GetCardsContent(
              image: 'assets/images/image_2.jpg',
              cardContent:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            ),
            // _GetCardsContent(
            //   image: 'assets/images/image_3.jpg',
            //   cardContent:
            //   'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            // ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      child: Image.asset("assets/images/image_3.jpg"),
                    ),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      style: GoogleFonts.pacifico(fontSize: 30.0),
                    ),
                    Container(
                      height: 48,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber,
                        ),
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => WelcomeScreen()));
                        },
                        child: const Text("Next"),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
          indicatorDotHeight: 7.0,
          indicatorDotWidth: 7.0,
          indicatorType: IndicatorType.expandingDots,
          indicatorPosition: IndicatorPosition.bottomCenter,
        ),
      ),
    );
  }
}

class _GetCardsContent extends StatelessWidget {
  final String image, cardContent;

  const _GetCardsContent({
    Key? key,
    this.image = '',
    this.cardContent = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              child: Image.asset(image),
            ),
            Text(
              cardContent,
              style: GoogleFonts.pacifico(fontSize: 30.0),
            ),
          ],
        ),
      ),
    );
  }
}