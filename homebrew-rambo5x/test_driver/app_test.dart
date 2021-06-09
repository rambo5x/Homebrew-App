// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });
  group('Happy Paths', () {
    /*
      Given I am on the Coffee Device Selection Screen
      When I tap "French Press"
      And I tap "Continue"
      And I enter "5"
      And I tap "Continue"
      Then I should see "63g - course ground coffee"
      And I should see "887g - water"
    */
    test("should give recommendation for French Press", () async {
      final findQuestionCoffeeText = find.byValueKey('coffee-maker-question');
      // final findFrenchPressText = find.byValueKey('French-press-text');
      final pressChooseMachineButton = find.byValueKey('french-press-key');
      final pressContinueMachineButton =
          find.byValueKey('press-continue-machine-button');
      final typeCupsTextfield = find.byValueKey('cups-amount-key');
      final pressContinueCupsButton =
          find.byValueKey('press-continue-cups-button');
      final findTotalCoffeeText =
          find.byValueKey('show coffee and water grams');
      final backtoHomeScreen = find.byValueKey('back-home-key');

      expect(await driver.getText(findQuestionCoffeeText),
          'What coffee maker are you using?');
      // await driver.tap(findFrenchPressText);
      await driver.tap(pressChooseMachineButton);
      await driver.tap(pressContinueMachineButton);
      await driver.tap(typeCupsTextfield);
      await driver.enterText('5');
      await driver.tap(pressContinueCupsButton);
      expect(await driver.getText(findTotalCoffeeText),
          '63g - course ground coffee\n         887g - water');
      await driver.tap(backtoHomeScreen);
    });

    /*
      Given I am on the Coffee Device Selection Screen
      When I tap "Drip Machine"
      And I tap "Continue"
      And I enter "5"
      And I tap "Continue"
      Then I should see "52g - medium ground coffee"
      And I should see "887g - water"
    */
    test("should give recommendation for Drip Machine", () async {
      //your code here
      final findQuestionCoffeeText = find.byValueKey('coffee-maker-question');
      // final findFrenchPressText = find.byValueKey('French-press-text');
      final pressChooseMachineButton = find.byValueKey('drip-machine-key');
      final pressContinueMachineButton =
          find.byValueKey('press-continue-machine-button');
      final typeCupsTextfield = find.byValueKey('cups-amount-key');
      final pressContinueCupsButton =
          find.byValueKey('press-continue-cups-button');
      final findTotalCoffeeText =
          find.byValueKey('show coffee and water grams');
      final backtoHomeScreen = find.byValueKey('back-home-key');

      expect(await driver.getText(findQuestionCoffeeText),
          'What coffee maker are you using?');
      // await driver.tap(findFrenchPressText);
      await driver.tap(pressChooseMachineButton);
      await driver.tap(pressContinueMachineButton);
      await driver.tap(typeCupsTextfield);
      await driver.enterText('5');
      await driver.tap(pressContinueCupsButton);
      expect(await driver.getText(findTotalCoffeeText),
          '52g - course ground coffee\n         887g - water');
      await driver.tap(backtoHomeScreen);
    });
  });

  group('Sad Paths', () {
    /*
      Given I am on the Coffee Device Selection Screen
      When I press "Continue"
      Then I expect to still be on the Coffee Device Selection Screen
    */
    test("should not advance from Choose Device Screen without a selection",
        () async {
      //your code here
      final findQuestionCoffeeText = find.byValueKey('coffee-maker-question');
      final pressContinueMachineButton =
          find.byValueKey('press-continue-machine-button');

      expect(await driver.getText(findQuestionCoffeeText),
          'What coffee maker are you using?');
      await driver.tap(pressContinueMachineButton);
      expect(await driver.getText(findQuestionCoffeeText),
          'What coffee maker are you using?');
    });

    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test(
        "should not advance from Choose Cups Screen without cups with french press chosen",
        () async {
      //your code here
      final findQuestionCoffeeText = find.byValueKey('coffee-maker-question');
      final findQuestionCupText = find.byValueKey('cups-question-key');
      // final findFrenchPressText = find.byValueKey('French-press-text');
      final pressChooseMachineButton = find.byValueKey('french-press-key');
      final pressContinueMachineButton =
          find.byValueKey('press-continue-machine-button');
      //final typeCupsTextfield = find.byValueKey('cups-amount-key');
      final pressContinueCupsButton =
          find.byValueKey('press-continue-cups-button');
      final pressBackCupsButton = find.byValueKey('back-btn-cups-key');

      expect(await driver.getText(findQuestionCoffeeText),
          'What coffee maker are you using?');
      // await driver.tap(findFrenchPressText);
      await driver.tap(pressChooseMachineButton);
      await driver.tap(pressContinueMachineButton);
      //await driver.tap(typeCupsTextfield);
      //await driver.enterText('5');
      expect(await driver.getText(findQuestionCupText),
          'How many cups would you like?');
      await driver.tap(pressContinueCupsButton);
      await driver.tap(pressBackCupsButton);
      await driver.getText(findQuestionCoffeeText);
    });

    /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test(
        "should not advance from Choose Cups Screen without cups with drip machine chosen",
        () async {
      //your code here
      final findQuestionCoffeeText = find.byValueKey('coffee-maker-question');
      final findQuestionCupText = find.byValueKey('cups-question-key');
      // final findFrenchPressText = find.byValueKey('French-press-text');
      final pressChooseMachineButton = find.byValueKey('drip-machine-key');

      final pressContinueMachineButton =
          find.byValueKey('press-continue-machine-button');
      //final typeCupsTextfield = find.byValueKey('cups-amount-key');
      final pressContinueCupsButton =
          find.byValueKey('press-continue-cups-button');

      expect(await driver.getText(findQuestionCoffeeText),
          'What coffee maker are you using?');
      // await driver.tap(findFrenchPressText);
      await driver.tap(pressChooseMachineButton);
      await driver.tap(pressContinueMachineButton);
      //await driver.tap(typeCupsTextfield);
      //await driver.enterText('5');
      expect(await driver.getText(findQuestionCupText),
          'How many cups would you like?');
      await driver.tap(pressContinueCupsButton);
    });
  });

  group('Back Button', () {
    //make up your own tests to check that the back button works
    //on every page
    test("checks results screen back button", () async {
      //your code here
      final findQuestionCupText = find.byValueKey('cups-question-key');
      // final findFrenchPressText = find.byValueKey('French-press-text');
      final typeCupsTextfield = find.byValueKey('cups-amount-key');
      final findTotalCoffeeText =
          find.byValueKey('show coffee and water grams');
      //final typeCupsTextfield = find.byValueKey('cups-amount-key');
      final pressContinueCupsButton =
          find.byValueKey('press-continue-cups-button');
      final pressBackResultsButton =
          find.byValueKey('back-btn-recommended-key');

      await driver.tap(typeCupsTextfield);
      await driver.enterText('5');
      expect(await driver.getText(findQuestionCupText),
          'How many cups would you like?');
      await driver.tap(pressContinueCupsButton);
      expect(await driver.getText(findTotalCoffeeText),
          '52g - course ground coffee\n         887g - water');
      await driver.tap(pressBackResultsButton);
      expect(await driver.getText(findQuestionCupText),
          'How many cups would you like?');
    });
    test("checks cup screen back button", () async {
      //your code here
      final findQuestionCoffeeText = find.byValueKey('coffee-maker-question');
      // final findFrenchPressText = find.byValueKey('French-press-text');

      final pressBackCupsButton = find.byValueKey('back-btn-cups-key');

      await driver.tap(pressBackCupsButton);
      expect(await driver.getText(findQuestionCoffeeText),
          'What coffee maker are you using?');
      //await driver.tap(pressBackResultsButton);
    });
  });
}
