import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:myshop/screens/auth/sign_up_form.dart';
import 'package:myshop/screens/sign_up/components/sign_up_form.dart';

void main() {
  testWidgets('SignUpForm widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: SignUpForm()),
    ));

    // Initial empty form fields
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Confirm Password'), findsOneWidget);
    expect(find.text('First Name'), findsOneWidget);
    expect(find.text('Last Name'), findsOneWidget);
    expect(find.text('Phone Number'), findsOneWidget);
    expect(find.text('Address'), findsOneWidget);

    // Simulate tapping on the "Continue" button without entering any data
    await tester.tap(find.text('Continue'));
    await tester.pump();

    // Expect validation errors for required fields
    expect(find.text('Please enter your email address'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);
    expect(find.text('Please re-enter your password'), findsOneWidget);
    expect(find.text('Please enter your first name'), findsOneWidget);
    expect(find.text('Please enter your last name'), findsOneWidget);
    expect(find.text('Please enter your phone number'), findsOneWidget);
    expect(find.text('Please enter your address'), findsOneWidget);

    // Enter valid data in the form fields
    await tester.enterText(
        find.byKey(const Key('emailField')), 'test@example.com');
    await tester.enterText(find.byKey(const Key('passwordField')), 'Test@123');
    await tester.enterText(
        find.byKey(const Key('confirmPasswordField')), 'Test@123');
    await tester.enterText(find.byKey(const Key('firstNameField')), 'John');
    await tester.enterText(find.byKey(const Key('lastNameField')), 'Doe');
    await tester.enterText(
        find.byKey(const Key('phoneNumberField')), '1234567890');
    await tester.enterText(
        find.byKey(const Key('addressField')), '123 Main St');

    // Simulate tapping on the "Continue" button with valid data
    await tester.tap(find.text('Continue'));
    await tester.pump();

    // Expect no validation errors
    expect(find.text('Please enter your email address'), findsNothing);
    expect(find.text('Please enter your password'), findsNothing);
    expect(find.text('Please re-enter your password'), findsNothing);
    expect(find.text('Please enter your first name'), findsNothing);
    expect(find.text('Please enter your last name'), findsNothing);
    expect(find.text('Please enter your phone number'), findsNothing);
    expect(find.text('Please enter your address'), findsNothing);

    // Additional test cases can be added based on your widget's functionality.

    // For example, you can test if the form submission navigates to the next screen.

    // You can also test other interactions and scenarios specific to your application.

    // Feel free to customize the test cases based on your requirements.
  });
}
