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
  Future<FeedItemModel> feedModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VoicesViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: ListView(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          children: [
            FutureBuilder<FeedItemModel>(
              future: feedModel,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return WebView(
                    initialUrl: snapshot.data.data[0].feedUrl,
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Center(child: LinearProgressIndicator());
              },
            ),
          ],
        ),
      ),
      viewModelBuilder: () => VoicesViewModel(),
      onModelReady: (model) {
        feedModel = model.loadFeed();
        if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
      },
    );
  }
}
