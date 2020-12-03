import 'package:flutter/cupertino.dart';
import 'package:owomaniya/model/users.dart';

class BaseModel extends ChangeNotifier {
  bool _busy;

  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  Users _user = new Users();

  Users get user => _user;

  void setUser(Users user) {
    _user = user;
    notifyListeners();
  }
}
