import 'package:flutter/cupertino.dart';
import 'package:owomaniya/model/user.dart';

class BaseModel extends ChangeNotifier {
  bool _busy;

  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  User _user = new User();

  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
