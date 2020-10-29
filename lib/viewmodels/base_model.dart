import 'package:flutter/cupertino.dart';
import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/services/network_service.dart';

class BaseModel extends ChangeNotifier {

  final NetworkService _networkService= getIt<NetworkService>();

  bool _busy ;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
