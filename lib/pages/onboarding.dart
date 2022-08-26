import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: Container(
        child: PageView(
          controller: controller,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/athletics_bg_temp.png'),
                ),
                // add black gradient for button to stand out
                Container(
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.black.withAlpha(0),
                        Colors.black12,
                        Colors.black45
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 160,
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const WormEffect(
                      spacing: 10,
                      dotHeight: 12,
                      dotWidth: 12,
                      dotColor: Colors.black38,
                      activeDotColor: Colors.white
                    ),
                  )
                ),
                Positioned(
                  bottom: 100,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () => controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                    style: ElevatedButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      primary: const Color(0xFF000b27)
                      // primary: Colors.white,
                      // onPrimary: Color(0xFF000b27)
                    ), 
                    child: const Text("NEXT"),
                  ),
                ),
                Positioned(
                  bottom: 55,
                  width: 150,
                  child: TextButton(
                    onPressed: () {
                      return controller.jumpToPage(2);
                    },
                    style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      primary: Colors.white,
                    ),
                    child: const Text("SKIP"),
                  ),
                )
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/athletics_bg_temp.png'),
                ),
                // add black gradient for button to stand out
                Container(
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.black.withAlpha(0),
                        Colors.black12,
                        Colors.black45
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 160,
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const WormEffect(
                      spacing: 10,
                      dotHeight: 12,
                      dotWidth: 12,
                      dotColor: Colors.black38,
                      activeDotColor: Colors.white
                    ),
                  )
                ),
                Positioned(
                  bottom: 100,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () => controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                    style: ElevatedButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      primary: const Color(0xFF000b27)
                      // primary: Colors.white,
                      // onPrimary: Color(0xFF000b27)
                    ), 
                    child: const Text("NEXT"),
                  ),
                ),
                Positioned(
                  bottom: 55,
                  width: 150,
                  child: TextButton(
                    onPressed: () {
                      return controller.jumpToPage(2);
                    },
                    style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      primary: Colors.white,
                    ),
                    child: const Text("SKIP"),
                  ),
                )
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/athletics_bg_temp.png'),
                ),
                // add black gradient for button to stand out
                Container(
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.black.withAlpha(0),
                        Colors.black12,
                        Colors.black45
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 160,
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const WormEffect(
                      spacing: 10,
                      dotHeight: 12,
                      dotWidth: 12,
                      dotColor: Colors.black38,
                      activeDotColor: Colors.white
                    ),
                  )
                ),
                Positioned(
                  bottom: 100,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () async {
                      // TODO: add shared preferences so everytime restart, don't show onboarding if they pass it
                      // this data stored on their phone

                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(builder: (context) => SportSelect())
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      primary: const Color(0xFF000b27)
                      // primary: Colors.white,
                      // onPrimary: Color(0xFF000b27)
                    ), 
                    child: const Text("LOGIN"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
