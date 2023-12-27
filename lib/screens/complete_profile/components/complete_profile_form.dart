import 'package:flutter/material.dart';
import 'package:myshop/components/custom_sufix_icon.dart';
import 'package:myshop/components/default_button.dart';
import 'package:myshop/models/user.dart';
import 'package:myshop/repository/user_repository.dart';
import 'package:myshop/screens/home/home_screen.dart';
// import 'package:myshop/screens/otp/otp_screen.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
        child: Column(
          children: [
            buildTextFormField(
              controller: firstNameController,
              labelText: "First Name",
              hintText: "Enter your first name",
              suffixIcon: 'assets/icons/User.svg',
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your first name";
                }
                return null;
              },
            ),
            SizedBox(height: screenHeight * 0.04),
            buildTextFormField(
              controller: lastNameController,
              labelText: "Last Name",
              hintText: "Enter your last name",
              suffixIcon: 'assets/icons/User.svg',
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your last name";
                }
                return null;
              },
            ),
            SizedBox(height: screenHeight * 0.04),
            buildTextFormField(
              controller: phoneNumberController,
              labelText: "Phone Number",
              hintText: "Enter your phone number",
              suffixIcon: 'assets/icons/Phone.svg',
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your phone number";
                }
                return null;
              },
            ),
            SizedBox(height: screenHeight * 0.04),
            buildTextFormField(
              controller: addressController,
              labelText: "Address",
              hintText: "Enter your address",
              suffixIcon: 'assets/icons/Location point.svg',
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your address";
                }
                return null;
              },
            ),
            SizedBox(height: screenHeight * 0.04),
            DefaultButton(
              text: "Continue",
              press: () async {
                if (_formKey.currentState!.validate()) {
                  final user = UserModel(
                      firstName: firstNameController.text.trim(),
                      lastName: lastNameController.text.trim(),
                      phoneNumber: phoneNumberController.text.trim(),
                      address: addressController.text.trim());
                  await UserRepository().userData(user, context);
                  // ignore: use_build_context_synchronously
                  Navigator.pushNamed(context, HomeScreen.routeName);
                }
              },
              width: 300,
              height: 48,
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required String suffixIcon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        suffixIcon: CustomSufixIcon(svgIcon: suffixIcon),
      ),
    );
  }
}










// import 'package:flutter/material.dart';
// import 'package:myshop/components/custom_sufix_icon.dart';
// import 'package:myshop/components/default_button.dart';
// import 'package:myshop/screens/otp/otp_screen.dart';

// class CompleteProfileForm extends StatefulWidget {
//   const CompleteProfileForm({super.key});

//   @override
//   State<CompleteProfileForm> createState() => _CompleteProfileFormState();
// }

// class _CompleteProfileFormState extends State<CompleteProfileForm> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Form(
//       child: Padding(
//         // Adjust the horizontal padding based on screen width
//         padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
//         child: Column(
//           children: [
//             firtName(),
//             SizedBox(height: screenHeight * 0.04),
//             lastName(),
//             SizedBox(height: screenHeight * 0.04),
//             phoneNumber(),
//             SizedBox(height: screenHeight * 0.04),
//             address(),
//             SizedBox(height: screenHeight * 0.04),
//             DefaultButton(
//               text: "Continue",
//               press: () {
//                 Navigator.pushNamed(context, OtpScreen.routeName);
//               },
//               width: 300,
//               height: 48,
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   // Email Method
//   TextFormField firtName() {
//     return TextFormField(
//       keyboardType: TextInputType.emailAddress,
//       controller: emailController,
//       validator: (value) {
//         if (value!.isEmpty) {
//           return "Please enter your first name";
//         }
//         return null;
//       },
//       decoration: const InputDecoration(
//         labelText: "First Name",
//         hintText: "Enter your first name",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: CustomSufixIcon(svgIcon: 'assets/icons/User.svg'),
//       ),
//     );
//   }

//   TextFormField lastName() {
//     return TextFormField(
//       keyboardType: TextInputType.emailAddress,
//       controller: emailController,
//       validator: (value) {
//         if (value!.isEmpty) {
//           return "Please enter your first name";
//         }
//         return null;
//       },
//       decoration: const InputDecoration(
//         labelText: "Last Name",
//         hintText: "Enter your Last name",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: CustomSufixIcon(svgIcon: 'assets/icons/User.svg'),
//       ),
//     );
//   }

//   TextFormField phoneNumber() {
//     return TextFormField(
//       keyboardType: TextInputType.number,
//       controller: emailController,
//       validator: (value) {
//         if (value!.isEmpty) {
//           return "Please enter your first name";
//         }
//         return null;
//       },
//       decoration: const InputDecoration(
//         labelText: "First Name",
//         hintText: "Enter your first name",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: CustomSufixIcon(svgIcon: 'assets/icons/Phone.svg'),
//       ),
//     );
//   }

//   TextFormField address() {
//     return TextFormField(
//       keyboardType: TextInputType.emailAddress,
//       controller: emailController,
//       validator: (value) {
//         if (value!.isEmpty) {
//           return "Please enter your first name";
//         }
//         return null;
//       },
//       decoration: const InputDecoration(
//         labelText: "Address",
//         hintText: "Enter your Address",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: CustomSufixIcon(svgIcon: 'assets/icons/Location point.svg'),
//       ),
//     );
//   }
// }
