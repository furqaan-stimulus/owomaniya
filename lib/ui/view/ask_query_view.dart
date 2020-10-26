import 'package:flutter/material.dart';
import 'package:owomaniya/viewmodels/ask_query_view_model.dart';
import 'package:stacked/stacked.dart';

class AskQueryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AskQueryViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text('Ask Query'),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text('Ask Query Page'),
                  ),
                  RaisedButton(
                    child: Text(' Sign up'),
                    onPressed: () => model.navigateToSignUpView(),
                  ),
                ],
              ),
            ),
        viewModelBuilder: () => AskQueryViewModel());
  }
}
