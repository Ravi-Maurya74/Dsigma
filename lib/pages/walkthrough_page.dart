import 'package:dsigma/pages/tab1.dart';
import 'package:dsigma/pages/tab2.dart';
import 'package:dsigma/pages/tab3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WalkThroughScreen extends StatelessWidget {
  WalkThroughScreen({super.key});

  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.red,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(3),
                        ),
                        color: Color(0xFFE8E0EA),
                      ),
                      child: const Text('Skip'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Expanded(
                child: Center(
                  child: PageView(
                    controller: controller,
                    children: const [
                      Tab1(),
                      Tab2(),
                      Tab3(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const SwapEffect(
                      activeDotColor: Color(0xFF6318AF),
                      dotColor: Color(0xFFE0D4EC)),
                ),
              ),
              GestureDetector(
                child: const CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xFF6318AF),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
