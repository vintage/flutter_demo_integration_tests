import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('App', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() => driver?.close());

    test('full flow', () async {
      final scrollable = find.byType("ListView");
      final loginForm = find.byType("LoginForm");

      await driver.scrollUntilVisible(
        scrollable,
        loginForm,
        dyScroll: -200,
        timeout: Duration(seconds: 3),
      );

      final usernameInput = find.byValueKey("username_input");
      final passwordInput = find.byValueKey("password_input");
      final submitButton = find.text("Login");

      await driver.tap(usernameInput);
      await driver.enterText("test");
      await driver.tap(passwordInput);
      await driver.enterText("12345");
      await driver.tap(submitButton);

      await driver.waitFor(find.text("Wrong credentials!"));

      await driver.tap(usernameInput);
      await driver.enterText("admin");
      await driver.tap(submitButton);

      await driver.waitFor(find.text("0"));

      final incrementButton = find.byType("FloatingActionButton");
      await driver.tap(incrementButton);
      await driver.tap(incrementButton);
      await driver.tap(incrementButton);

      await driver.waitFor(find.text("3"));
    }, timeout: Timeout(Duration(days: 1)));
  });
}
