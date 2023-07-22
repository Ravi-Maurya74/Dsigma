import 'dart:async';

import 'package:flutter/material.dart';

class Tab2 extends StatelessWidget {
  const Tab2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              children: [
                const AnimatedGamla(),
                Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bhooki aurat.png'),
                    ),
                  ),
                ),
                const AnimatedFoodLeft(
                    path: "assets/food/sandwich.png",
                    topStart: 100,
                    topEnd: 130,
                    leftStart: 70,
                    leftEnd: 50),
                const AnimatedFoodLeft(
                    path: "assets/food/donut.png",
                    topStart: 60,
                    topEnd: 70,
                    leftStart: 50,
                    leftEnd: 10),
                const AnimatedFoodLeft(
                    path: "assets/food/burger.png",
                    topStart: 15,
                    topEnd: 0,
                    leftStart: 80,
                    leftEnd: 50),
                const AnimatedFoodRight(
                    path: "assets/food/salad.png",
                    topStart: 15,
                    topEnd: 0,
                    rightStart: 80,
                    rightEnd: 50),
                const AnimatedFoodRight(
                    path: "assets/food/aple.png",
                    topStart: 60,
                    topEnd: 70,
                    rightStart: 50,
                    rightEnd: 10),
                const AnimatedFoodRight(
                    path: "assets/food/fish.png",
                    topStart: 100,
                    topEnd: 130,
                    rightStart: 70,
                    rightEnd: 50),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Exquisite Catering',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 27),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Experience culinary artistry like never before with our innovating and exquisite cusin creations.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedGamla extends StatefulWidget {
  const AnimatedGamla({
    super.key,
  });

  @override
  State<AnimatedGamla> createState() => _AnimatedGamlaState();
}

class _AnimatedGamlaState extends State<AnimatedGamla> {
  late Timer _timer;
  bool left = true;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        left = !left;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        duration: const Duration(milliseconds: 500),
        bottom: 0,
        curve: Curves.easeIn,
        left: left ? 0 : 220,
        child: const SizedBox(
          height: 150,
          width: 80,
          child: Image(image: AssetImage("assets/images/gamla1.png")),
        ));
  }
}

class AnimatedFoodLeft extends StatefulWidget {
  const AnimatedFoodLeft({
    super.key,
    required this.path,
    required this.topStart,
    required this.topEnd,
    required this.leftStart,
    required this.leftEnd,
  });
  final String path;
  final double topStart, topEnd, leftStart, leftEnd;

  @override
  State<AnimatedFoodLeft> createState() => _AnimatedFoodLeftState();
}

class _AnimatedFoodLeftState extends State<AnimatedFoodLeft> {
  bool finished = true;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        finished = !finished;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
      top: finished ? widget.topStart : widget.topEnd,
      left: finished ? widget.leftStart : widget.leftEnd,
      child: SizedBox(
        height: 40,
        width: 40,
        child: Image(
          image: AssetImage(widget.path),
        ),
      ),
    );
  }
}

class AnimatedFoodRight extends StatefulWidget {
  const AnimatedFoodRight({
    super.key,
    required this.path,
    required this.topStart,
    required this.topEnd,
    required this.rightStart,
    required this.rightEnd,
  });
  final String path;
  final double topStart, topEnd, rightStart, rightEnd;

  @override
  State<AnimatedFoodRight> createState() => _AnimatedFoodRightState();
}

class _AnimatedFoodRightState extends State<AnimatedFoodRight> {
  bool finished = true;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        finished = !finished;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
      top: finished ? widget.topStart : widget.topEnd,
      right: finished ? widget.rightStart : widget.rightEnd,
      child: SizedBox(
        height: 40,
        width: 40,
        child: Image(
          image: AssetImage(widget.path),
        ),
      ),
    );
  }
}
