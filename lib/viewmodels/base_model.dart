import 'package:flutter/cupertino.dart';

class BaseModel extends ChangeNotifier {
  bool _busy;

  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
