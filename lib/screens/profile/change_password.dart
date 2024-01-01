// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myshop/components/default_button.dart';

class PasswordChangeBottomSheet extends StatefulWidget {
  const PasswordChangeBottomSheet({super.key});

  @override
  _PasswordChangeBottomSheetState createState() =>
      _PasswordChangeBottomSheetState();
}

class _PasswordChangeBottomSheetState extends State<PasswordChangeBottomSheet> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _currentPasswordController,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Current Password'),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _newPasswordController,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'New Password'),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: true,
            decoration:
                const InputDecoration(labelText: 'Confirm New Password'),
          ),
          const SizedBox(height: 16),
          // ElevatedButton(
          //   onPressed: _changePassword,
          //   child: const Text('Change Password'),
          // ),

          DefaultButton(
              text: 'Change Password',
              press: _changePassword,
              width: 1,
              height: 0.12)
        ],
      ),
    );
  }

  Future<void> _changePassword() async {
    try {
      String currentPassword = _currentPasswordController.text;
      String newPassword = _newPasswordController.text;
      String confirmPassword = _confirmPasswordController.text;

      // Check if any field is empty
      if (currentPassword.isEmpty ||
          newPassword.isEmpty ||
          confirmPassword.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please fill in all fields'),
          ),
        );
        return;
      }

      if (newPassword != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('New password and confirm password do not match'),
          ),
        );
        return;
      }

      // Reauthenticate the user with their current password
      var authCredential = EmailAuthProvider.credential(
        email: FirebaseAuth.instance.currentUser!.email!,
        password: currentPassword,
      );

      await FirebaseAuth.instance.currentUser!
          .reauthenticateWithCredential(authCredential);

      // Update the password in Firebase Auth
      await FirebaseAuth.instance.currentUser!.updatePassword(newPassword);

      // Close the bottom sheet
      Navigator.pop(context);

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password updated successfully'),
        ),
      );
    } catch (e) {
      print('Error changing password: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to change password. Please check your input.'),
        ),
      );
    }
  }
}
