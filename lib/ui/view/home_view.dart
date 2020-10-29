import 'package:flutter/material.dart';
import 'package:owomaniya/viewmodels/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Home'),

        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Welcome '),
              RaisedButton(
                child: Text(' Ask Your Query'),
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(
                    30.0, 14.0, 30.0, 14.0),
                onPressed: () => model.navigateToQueryView(),
                color: Colors.pink,
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),

    );
  }
}
