import 'package:dsigma/pages/home_page.dart';
import 'package:dsigma/pages/walkthrough_page.dart';
import 'package:dsigma/services/auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _zoomLevel = 1.0; // Initial zoom level

  void _animateZoom() {
    setState(() {
      _zoomLevel = 2.0; // Set the zoom level to 2.0 (adjust as needed)
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => _animateZoom(),
    );
    Future.delayed(
      const Duration(seconds: 4),
      () {
        if (Auth().currentUser != null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
              (route) => false);
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => WalkThroughScreen(),
              ),
              (route) => false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1), // Animation duration
            curve: Curves.easeInOut, // Animation curve
            transform: Matrix4.diagonal3Values(_zoomLevel, _zoomLevel, 1.0),
            child: const SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image(
                image: AssetImage("assets/images/splash.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AnimatedLogo(),
              AnimatedText(),
            ],
          )
        ],
      ),
    );
  }
}

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({
    super.key,
  });

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  double _size = 200;

  void _animateZoom() {
    setState(() {
      _size = 230;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        _animateZoom();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.easeOutBack,
      height: _size,
      width: _size,
      child: const Image(image: AssetImage("assets/icons/logo.png")),
    );
  }
}

class AnimatedText extends StatefulWidget {
  const AnimatedText({
    super.key,
  });

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  CrossFadeState _crossFadeState = CrossFadeState.showFirst;
  double _height = 100;
  void _animate() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        setState(() {
          _crossFadeState = CrossFadeState.showSecond;
          _height = 40;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _animate();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedCrossFade(
        layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                key: bottomChildKey,
                top: 0,
                child: bottomChild,
              ),
              Positioned(
                key: topChildKey,
                child: topChild,
              ),
            ],
          );
        },
        firstChild: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              "Welcome",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: const Color.fromARGB(255, 247, 229, 183)),
            ),
          ],
        ),
        secondChild: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: _height,
              curve: Curves.easeOutBack,
            ),
            Text(
              "Craft My Plate",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: const Color.fromARGB(255, 247, 229, 183)),
            ),
            Text(
              "You customize, we cater",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: const Color.fromARGB(255, 234, 181, 50)),
            ),
          ],
        ),
        crossFadeState: _crossFadeState,
        duration: const Duration(milliseconds: 500),
        firstCurve: Curves.easeIn,
        secondCurve: Curves.easeIn,
      ),
    );
  }
}
