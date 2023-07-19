import 'dart:async';

import 'package:flutter/material.dart';

class Tab2 extends StatelessWidget {
  const Tab2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bhooki aurat.png'),
                  ),
                ),
              ),
              const Sandwich()
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
    );
  }
}

class Sandwich extends StatefulWidget {
  const Sandwich({
    super.key,
  });

  @override
  State<Sandwich> createState() => _SandwichState();
}

class _SandwichState extends State<Sandwich> {
  bool finished = false;
  void Animate() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        finished = !finished;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    Animate();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      top: finished ? 70 : 90,
      left: finished ? 60 : 20,
      child: const SizedBox(
        height: 40,
        width: 40,
        child: Image(
          image: AssetImage("assets/food/sandwich.png"),
        ),
      ),
    );
  }
}
