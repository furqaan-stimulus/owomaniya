class User {
  String userId;
  String token;
  String email;
  String mobileNo;
  String dateOfBirth;
  String gender;
  String password;
  String deviceType;
  String deviceOs;
  String firstName;
  String lastName;

  User(
      {this.userId,
        this.token,
      this.email,
      this.mobileNo,
      this.gender,
      this.password,
      this.dateOfBirth,
      this.deviceOs,
      this.deviceType,
      this.firstName,
      this.lastName});

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      userId: map['user_id'],
      token: map['device_token'],
      email: map['email_address'],
      mobileNo: map['mobile_no'],
      dateOfBirth: map['date_of_birth'],
      gender: map['gender'],
      password: map['password'],
      deviceType: map['device_type'],
      deviceOs: map['device_os'],
      firstName: map['first_name'],
      lastName: map['last_name'],
    );
  }
}
