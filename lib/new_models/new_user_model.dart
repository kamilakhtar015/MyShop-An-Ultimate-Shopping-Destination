// ignore_for_file: file_names

class UserModel {
  final String uId;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  // final String userImg;
  final String address;
  final String password;
  // final String confirmPassword;

  UserModel({
    required this.uId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    // required this.userImg,
    required this.address,
    required this.password,
    // required this.confirmPassword
  });

  // Serialize the UserModel instance to a JSON map
  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      // 'userImg': userImg,
      'address': address,
      'password': password,
      // 'confirmPassword': confirmPassword,
    };
  }

  // Create a UserModel instance from a JSON map
  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      uId: json['uId'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      // userImg: json['userImg'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      address: json['address'],
      password: json['password'],
      // confirmPassword: json['confirmPassword'],
    );
  }
}
