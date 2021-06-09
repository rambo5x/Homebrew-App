import 'package:homebrew/utils/coffee_tools.dart';
import 'package:test/test.dart';

void main() {
  group("cupsToOunces", () {
    test('calculates ounces on 1 cup', () {
      var ounces = CoffeeTools.cupsToOunces(1);
      expect(ounces, 6);
    });

    test('calculates ounces on positive number of cups', () {
      var ounces = CoffeeTools.cupsToOunces(4);
      expect(ounces, 24);
    });

    test('throws ArgumentError on zero', () {
      expect(() => CoffeeTools.cupsToOunces(0), throwsArgumentError);
    });

    test('throws ArgumentError on negative number', () {
      expect(() => CoffeeTools.cupsToOunces(0), throwsArgumentError);
    });
  });

  group("coffeGramsForCups", () {
    test(
        'checks if its 1 cup for the right amount of coffee grams and is a drip machine type',
        () {
      var cTotal = CoffeeTools.coffeGramsForCups(1, true, false);
      expect(double.parse((cTotal).toStringAsFixed(3)),
          double.parse((10.43647058).toStringAsFixed(3)));
    });
    test(
        'checks if its 1 cup for the right amount of coffee grams and is a french press machine type',
        () {
      var cTotal = CoffeeTools.coffeGramsForCups(1, false, true);
      expect(double.parse((cTotal).toStringAsFixed(3)),
          double.parse((12.67285714).toStringAsFixed(3)));
    });
    test('throws ArgumentError on no machine selected but uses 1 cup', () {
      expect(() => CoffeeTools.coffeGramsForCups(1, false, false),
          throwsArgumentError);
    });
  });

  group("waterGramsForCups", () {
    test('checks for the right amount of grams of water for 1 cup', () {
      var cTotal = CoffeeTools.waterGramsForCups(1);
      expect(double.parse((cTotal).toStringAsFixed(2)),
          double.parse((177.42).toStringAsFixed(2)));
    });

    test('checks for the right amount of grams of water for 3 cups', () {
      var cTotal = CoffeeTools.waterGramsForCups(3);
      expect(double.parse((cTotal).toStringAsFixed(2)),
          double.parse((532.26).toStringAsFixed(2)));
    });
  });
}
