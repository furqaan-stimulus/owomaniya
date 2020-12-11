import 'package:date_time_picker/date_time_picker.dart';
import 'package:owomaniya/Enums/gender.dart';
import 'package:owomaniya/model/user_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(UserLogin user) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    Gender gender;
    preferences.setInt('user_id', user.data.user.id);
    preferences.setString('email_address', user.data.user.emailAddress);
    preferences.setString('mobile_no', user.data.user.mobileNo);
    preferences.setString(
        'date_of_birth', user.data.user.dateOfBirth.toString());
    preferences.setString('gender', gender.toString());
    preferences.setString('first_name', user.data.user.firstName);
    preferences.setString('last_name', user.data.user.lastName);
    preferences.setString('token', user.data.token);
    preferences.commit();
    return true;
  }

  Future<UserLogin> getUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    Gender gender;
    int userId = preferences.getInt('user_id');
    String token = preferences.getString("token");
    String email = preferences.getString('email');

    String mobileNumber = preferences.getString('mobile_number');
    String dateOfBirth = preferences.getString('date_of_birth').toString();

    String firstName = preferences.getString('first_name');
    String lastName = preferences.getString('last_name');

    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    return UserLogin();
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
