import 'dart:io';
import 'package:flutter/material.dart';
import 'package:owomaniya/model/feed_item_model.dart';
import 'package:owomaniya/viewmodels/voices_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VoicesView extends StatefulWidget {
  @override
  _VoicesViewState createState() => _VoicesViewState();
}

class _VoicesViewState extends State<VoicesView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VoicesViewModel>.reactive(
      builder: (context, model, child) => Scaffold(),
      viewModelBuilder: () => VoicesViewModel(),
      onModelReady: (model) {
        if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
      },
    );
  }
}
