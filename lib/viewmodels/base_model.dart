import 'package:flutter/cupertino.dart';

class BaseModel extends ChangeNotifier {
  // final AuthenticationService _authenticationService =
  // getIt<AuthenticationService>();
  //
  // Users get currentUser => _authenticationService.currentUser;

  bool _busy = false;

  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
