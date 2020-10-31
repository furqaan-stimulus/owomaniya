import 'package:owomaniya/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  Future<bool> saveUser(User user) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString('user_id', user.userId);
    preferences.setString('device_token', user.token);
    preferences.setString('email_address', user.email);
    preferences.setString('mobile_no', user.mobileNo);
    preferences.setString('date_of_birth', user.dateOfBirth);
    preferences.setString('gender', user.gender);
    preferences.setString('password', user.password);
    preferences.setString('device_type', user.deviceType);
    preferences.setString('device_os', user.deviceOs);
    preferences.setString('first_name', user.firstName);
    preferences.setString('last_name', user.lastName);

    return preferences.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String userId = preferences.getString('user_id');
    String email = preferences.getString('email');
    String token = preferences.getString('device_token');
    String mobileNumber = preferences.getString('mobile_number');
    String dateOfBirth = preferences.getString('date_of_birth');
    String gender = preferences.getString('gender');
    String password = preferences.getString('password');
    String deviceType = preferences.getString('device_type');
    String deviceOs = preferences.getString('device_os');
    String firstName = preferences.getString('first_name');
    String lastName = preferences.getString('last_name');

    return User(
        userId: userId,
        token: token,
        email: email,
        mobileNo: mobileNumber,
        dateOfBirth: dateOfBirth,
        gender: gender,
        password: password,
        deviceType: deviceType,
        deviceOs: deviceOs,
        firstName: firstName,
        lastName: lastName);
  }
}
