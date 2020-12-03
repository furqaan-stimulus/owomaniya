import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:owomaniya/model/terms_model.dart';
import 'package:owomaniya/viewmodels/terms_of_service_view_model.dart';
import 'package:stacked/stacked.dart';

class TermsOfServiceView extends StatefulWidget {
  @override
  _TermsOfServiceViewState createState() => _TermsOfServiceViewState();
}

class _TermsOfServiceViewState extends State<TermsOfServiceView> {
  Future<TermsModel> termsModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TermsOfServiceViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Terms of Service'),
        ),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            FutureBuilder<TermsModel>(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Html(data: snapshot.data.data);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Center(child: CircularProgressIndicator());
              },
              future: termsModel,
            ),
          ],
        ),
      ),
      viewModelBuilder: () => TermsOfServiceViewModel(),
      onModelReady: (model) {
        termsModel = model.getTermsOfService();
      },
    );
  }
}
