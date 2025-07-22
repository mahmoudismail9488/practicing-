import 'package:flutter/material.dart';
import 'package:new_app/app/auth%20cycle/views/sign_in_screen.dart';
import 'package:new_app/app/auth%20cycle/views/sign_up_screen.dart';
import 'package:new_app/app/auth cycle/models/on_boarding_mesaages.dart';
import 'package:new_app/app/auth%20cycle/widget/next_button.dart';
import 'package:new_app/styles/colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController onBoardingPageController = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar contains conditional for (Skip Button)
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          if (currentPage != onBoardingPages.length - 1)
            TextButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (ctx) => SignInScreen()));
              },
              child: Text(
                "Skip",
                style: Theme.of(context).textTheme.titleMedium!,
              ),
            ),
        ],
      ),
      // body contains the page view to view onboarding data
      body: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
        itemCount: onBoardingPages.length,
        controller: onBoardingPageController,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      onBoardingPages[index].imagePath,
                      width: 343,
                      height: 263.85,
                    ),
                    Text(
                      onBoardingPages[index].title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        onBoardingPages[index].description,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),

              // column of buttons and indicator dots
              Padding(
                padding: const EdgeInsets.only(bottom: 96.0),
                child: Column(
                  children: [
                    // next button container if not the last page
                    if (index < onBoardingPages.length - 1)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: Container(
                          width: double.infinity,
                          child: NextButton(
                            nextFunction: () {
                              if (currentPage == onBoardingPages.length) {
                                return;
                              }
                              setState(() {
                                currentPage = currentPage + 1;
                              });
                              onBoardingPageController.nextPage(
                                duration: Duration(milliseconds: 100),
                                curve: Curves.linear,
                              );
                            },
                            text: "Next",
                          ),
                        ),
                      ),
                    // auth button if last page
                    if (index >= onBoardingPages.length - 1)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: Row(
                          spacing: 16,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                style: Theme.of(
                                  context,
                                ).outlinedButtonTheme.style,
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (ctx) => SignInScreen(),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12.0,
                                    horizontal: 24,
                                  ),
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Expanded(
                              child: ElevatedButton(
                                style: Theme.of(
                                  context,
                                ).elevatedButtonTheme.style,
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (ctx) => SignUpScreen(),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12.0,
                                    horizontal: 24,
                                  ),
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    // row of dots for page progress
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i = 0; i < onBoardingPages.length; i++)
                          InkWell(
                            onTap: () {
                              setState(() {
                                onBoardingPageController.jumpToPage(i);
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 2.0,
                              ),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                width: i == currentPage ? 30 : 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: i == currentPage
                                      ? Theme.of(context).primaryColor
                                      : lightLabelTextColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
