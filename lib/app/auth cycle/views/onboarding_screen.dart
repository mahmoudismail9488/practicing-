import 'package:flutter/material.dart';
import 'package:new_app/app/auth%20cycle/views/sign_up_screen.dart';
// model of onborading

class OnBoardingData {
  const OnBoardingData(this.title, this.description, this.imagePath);
  final String title;
  final String description;
  final String imagePath;
}

List<OnBoardingData> onBoardingPages = [
  OnBoardingData(
    "Expand your business and reach new customers",
    "Easily receive orders from customers and price them directly from the app.",
    "assets/imgs/on_boarding1.png",
  ),
  OnBoardingData(
    "Set your price and set your terms",
    "Offer pricing based on quantity, availability, and location. Monitor the competition to offer the best deal to your customers.",
    "assets/imgs/on_boarding2.png",
  ),
  OnBoardingData(
    "Smart dashboard for your business",
    "Track orders, record your past offers, review monthly performance, and connect with customers all in one place.",
    "assets/imgs/on_boarding3.png",
  ),
];

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
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          if (currentPage != onBoardingPages.length - 1)
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => SignUpScreen()),
                );
              },
              child: Text(
                "Skip",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16,
                ),
              ),
            ),
        ],
      ),
      body: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
        itemCount: onBoardingPages.length,
        allowImplicitScrolling: false,
        controller: onBoardingPageController,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16,
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
              SizedBox(height: 24),
              if (index < onBoardingPages.length - 1)
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              if (index >= onBoardingPages.length - 1)
                Row(
                  spacing: 16,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            width: 1,
                            color: Theme.of(context).primaryColor,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(12),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {},
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
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(12),
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {},
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
            ],
          ),
        ),
      ),
    );
  }
}
