import 'package:flutter/material.dart';
import 'package:flutter_starting_project/login_signup.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingExample extends StatelessWidget {
  // const OnBoardingExample({super.key});

  @override
  Widget build(BuildContext context) {
    PageDecoration pageDecoration = const PageDecoration(
        titleTextStyle: TextStyle(
            color: Colors.deepPurple,
            fontSize: 35,
            fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(
            color: Colors.red, fontSize: 20, fontStyle: FontStyle.italic),
        imagePadding: EdgeInsets.all(12));

    return IntroductionScreen(
      pages: [
        PageViewModel(
            decoration: pageDecoration,
            body: 'page 1',
            title: 'Page One',
            image: Image.asset('assets/images/my profile pic.jpg')),
        PageViewModel(
            // decoration: pageDecoration,
            body: 'page 2',
            title: 'Page Two',
            image: Image.asset('assets/images/IMG_1466.JPG')),
        PageViewModel(
            decoration: pageDecoration,
            body: 'page 3',
            title: 'Page Three',
            image: Image.asset('assets/images/IMG_1439.JPG')),
        PageViewModel(
            decoration: pageDecoration,
            body: 'page 4',
            title: 'Page Three',
            image: Image.asset('assets/images/IMG_1439.JPG')),
        PageViewModel(
            decoration: pageDecoration,
            body: 'page 5',
            title: 'Page Three',
            image: Image.asset('assets/images/IMG_1439.JPG')),
      ],
      done: const Text('Done'),
      skip: const Text('Skip'),
      next: const Text('Next'),
      back: const Text('back'),
      showSkipButton: true,
      dotsDecorator: const DotsDecorator(
        color: Colors.grey,
        activeColor: Colors.black,
        // size: Size.fromRadius(5)
        size: Size(10, 10),
        activeSize: Size(20, 10),
        // activeShape:
      ),
      onDone: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LoginSignup(),
      )),
      onSkip: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LoginSignup(),
      )),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OnBoardingExample(),
  ));
}
