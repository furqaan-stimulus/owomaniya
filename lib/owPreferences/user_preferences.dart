import 'package:date_time_picker/date_time_picker.dart';
import 'package:owomaniya/Enums/gender.dart';
import 'package:owomaniya/model/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(Users user) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    Gender gender;
    preferences.setInt('user_id', user.id);
    preferences.setString('email_address', user.emailAddress);
    preferences.setString('mobile_no', user.mobileNo);
    preferences.setString('date_of_birth', user.dateOfBirth.toString());
    preferences.setString('gender', gender.toString());
    preferences.setString('password', user.password);
    preferences.setString('first_name', user.firstName);
    preferences.setString('last_name', user.lastName);
    preferences.commit();
    return true;
  }

  Future<Users> getUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    Gender gender;
    int userId = preferences.getInt('user_id');
    String email = preferences.getString('email');
    String token = preferences.getString('device_token');
    String mobileNumber = preferences.getString('mobile_number');
    String dateOfBirth = preferences.getString('date_of_birth').toString();
    String password = preferences.getString('password');
    String firstName = preferences.getString('first_name');
    String lastName = preferences.getString('last_name');

    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    return Users(
        id: userId,
        emailAddress: email,
        mobileNo: mobileNumber,
        dateOfBirth: DateTime.parse(formatted),
        gender: gender,
        rememberToken: token,
        password: password,
        firstName: firstName,
        lastName: lastName);


  }

  void removeUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('first_name');
    preferences.remove('last_name');
    preferences.remove('email');
    preferences.remove('remember_token');
    preferences.remove('user_id');
    preferences.remove('token');
    preferences.commit();
  }
}
