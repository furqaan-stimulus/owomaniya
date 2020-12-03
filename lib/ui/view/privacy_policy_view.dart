import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:owomaniya/model/privacy_model.dart';
import 'package:owomaniya/viewmodels/privacy_policy_view_model.dart';
import 'package:stacked/stacked.dart';

class PrivacyPolicyView extends StatelessWidget {
  Future<PrivacyModel> privacyModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PrivacyPolicyViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Privacy Policy'),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            FutureBuilder<PrivacyModel>(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Html(data: snapshot.data.data);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Center(child: CircularProgressIndicator());
              },
              future: privacyModel,
            ),
          ],
        ),
      ),
      viewModelBuilder: () => PrivacyPolicyViewModel(),
      onModelReady: (model) {
        privacyModel = model.getPrivacyPolicy();
      },
    );
  }
}
