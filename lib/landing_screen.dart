import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:x_chat/home_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late bool isFinished;

  @override
  void initState() {
    isFinished = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/background.png',
                  ),
                  fit: BoxFit.cover)),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2.5,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                const Text(
                  "Express yourself with Xchat",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Chat using avatar emoji gives a different impression, dare to try it ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 20),
                SwipeableButtonView(
                    isFinished: isFinished,
                    onFinish: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const HomeScreen(),
                        ),
                      );
                    },
                    onWaitingProcess: () {
                      setState(() {
                        isFinished = true;
                      });
                    },
                    activeColor: Colors.blue,
                    buttonWidget: const Icon(
                      CupertinoIcons.chevron_right_2,
                      color: Colors.grey,
                    ),
                    buttonText: "Swipe to start")
              ],
            ),
          ),
        )
      ]),
    );
  }
}
