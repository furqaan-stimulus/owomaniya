import 'package:flutter/material.dart';
import 'package:owomaniya/viewmodels/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) =>
          Scaffold(
            appBar: AppBar(
              title: Text('Home'),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('Welcome to Home Screen'),
                ),
                RaisedButton(
                  child: Text(' Ask Your Query'),
                  onPressed: () => model.navigateToQueryView(),
                ),
              ],
            ),
          ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
