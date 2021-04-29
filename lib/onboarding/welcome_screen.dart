import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kap/auth/mobile_screen.dart';

class WelcomeScreens extends StatelessWidget {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          // titleWidget: Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [

          //     Text("A Different Kind of Commerce.")
          //     ],
          // ),
          decoration: const PageDecoration(
              pageColor:
                  //  Color(0XFFe3e9e5)
                  Color(0XFF869ba0)),
          title: "",
          bodyWidget: Column(
            children: [
              Text("A Different Kind of Commerce."),
              Text("Join the Revolution.")
            ],
          )),
      PageViewModel(title: 'A Different Kind of Commerce.', body: 'hello'),
      PageViewModel(title: 'A Different Kind of Commerce.', body: 'hello'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
            // showSkipButton: true,
            next: const Icon(Icons.arrow_forward_ios_outlined),
            showDoneButton: true,
            showNextButton: true,
            showSkipButton: true,
            color: Color(0XFF869ba0),
            skip: Text("Skip"),
            done: Text(
              'Done',
              style: GoogleFonts.roboto(
                color: Colors.black,
              ),
            ),
            onDone: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MobileScreen()),
                  (route) => false);
            },
            globalBackgroundColor: Colors.amber,
            pages: getPages(),
            dotsDecorator: DotsDecorator(
                size: const Size.square(10.0),
                activeSize: const Size(20.0, 10.0),
                activeColor: Color(0XFFf7c73f),
                color: Colors.black26,
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)))));
  }
}
