import 'package:homebrew/screens/choose_device_screen.dart';
import 'package:homebrew/models/UserData.dart';

class CoffeeTools {
  // Input: number of cups (positive integer)
  // Output: number of ounces in a cup
  double gramsForCups = 0.0;
  double gramsForWater = 0.0;
  UserData data;

  static int cupsToOunces(int cups) {
    if (cups <= 0) {
      throw ArgumentError();
    }
    return cups * 6;
  }

  static double coffeGramsForCups(int cups, bool isDPC, bool isFP) {
    if (cups <= 0 || (isDPC == false && isFP == false)) {
      throw ArgumentError();
    }
    if (isDPC) {
      return (cupsToOunces(cups) * (177.42 / 6) / 17);
    } else if (isFP) {
      return (cupsToOunces(cups) * (177.42 / 6) / 14);
    }

    return 0.0;
  }

  static double waterGramsForCups(int cups) {
    if (cups <= 0) {
      throw ArgumentError();
    }
    return (cupsToOunces(cups) * (177.42 / 6));
  }
}
