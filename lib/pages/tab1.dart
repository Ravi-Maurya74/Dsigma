import 'package:flutter/material.dart';

class Tab1 extends StatelessWidget {
  const Tab1({super.key});

  @override
  Widget build(BuildContext context) {
    // double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Bottle(),
              SizedBox(
                width: 8,
              ),
              FoodPlate(),
              SizedBox(
                width: 18,
              ),
              Drink(),
              SizedBox(
                width: 10,
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 240,
            child: Image.asset('assets/images/plate shadow.png'),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Create Your Own Plate',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w500, fontSize: 27),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Create unforgettable memories with our unique feature to curate your favorite cusines and food, tailored to your special occasions.',
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

class Drink extends StatefulWidget {
  const Drink({
    super.key,
  });

  @override
  State<Drink> createState() => _DrinkState();
}

class _DrinkState extends State<Drink> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    Curve curve = Curves.easeInOutBack;
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 6))
          ..repeat();
    _animation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: (1 / 12), end: 0)
              .chain(CurveTween(curve: curve)),
          weight: 25,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: -(1 / 12))
              .chain(CurveTween(curve: curve)),
          weight: 25,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: -(1 / 12), end: 0)
              .chain(CurveTween(curve: curve)),
          weight: 25,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: (1 / 12))
              .chain(CurveTween(curve: curve)),
          weight: 25,
        ),
      ],
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: Container(
        height: 100,
        width: 50,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/cold drink.png'),
          ),
        ),
      ),
    );
  }
}

class Bottle extends StatefulWidget {
  const Bottle({
    super.key,
  });

  @override
  State<Bottle> createState() => _BottleState();
}

class _BottleState extends State<Bottle> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    Curve curve = Curves.easeInOutBack;
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..repeat(reverse: true);
    _animation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: (1 / 12))
              .chain(CurveTween(curve: curve)),
          weight: 50,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: (1 / 12), end: (2 / 12))
              .chain(CurveTween(curve: curve)),
          weight: 50,
        ),
      ],
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: Container(
        height: 120,
        width: 70,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/daru.png'),
          ),
        ),
      ),
    );
  }
}

class FoodPlate extends StatefulWidget {
  const FoodPlate({
    super.key,
  });

  @override
  State<FoodPlate> createState() => _FoodPlateState();
}

class _FoodPlateState extends State<FoodPlate>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    Curve curve = Curves.easeInOutBack;
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 6))
          ..repeat();
    _animation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 0.25)
              .chain(CurveTween(curve: curve)),
          weight: 25,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.25, end: 0.50)
              .chain(CurveTween(curve: curve)),
          weight: 25,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.50, end: 0.75)
              .chain(CurveTween(curve: curve)),
          weight: 25,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.75, end: 1)
              .chain(CurveTween(curve: curve)),
          weight: 25,
        ),
      ],
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: Container(
        height: 200,
        width: 200,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/food plate.png'),
          ),
        ),
      ),
    );
  }
}
