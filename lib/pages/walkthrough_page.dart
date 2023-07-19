import 'package:dsigma/pages/tab1.dart';
import 'package:dsigma/pages/tab2.dart';
import 'package:dsigma/pages/tab3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              BottomButton(controller: controller),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomButton extends StatefulWidget {
  const BottomButton({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  bool _expanded = false;
  bool _text = false;
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_animate);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_animate);
    super.dispose();
  }

  void _animate() {
    if (widget.controller.page == 2) {
      setState(() {
        _expanded = true;
        Future.delayed(
          const Duration(seconds: 1),
          () {
            setState(() {
              _text = true;
            });
          },
        );
      });
    } else {
      setState(() {
        _text = false;
        _expanded = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.vibrate();
        widget.controller.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE0D4EC),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              width: _expanded ? 140 : 0,
              duration: const Duration(seconds: 1),
              curve: Curves.easeOut,
              child: _text
                  ? Center(
                      child: Text(
                      "Get Started",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: const Color(0xFF6318AF),
                          fontWeight: FontWeight.bold),
                    ))
                  : null,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xFF6318AF),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
