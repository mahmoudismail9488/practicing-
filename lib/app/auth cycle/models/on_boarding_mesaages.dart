class OnBoardingData {
  const OnBoardingData(this.title, this.description, this.imagePath);
  final String title;
  final String description;
  final String imagePath;
}

//
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
