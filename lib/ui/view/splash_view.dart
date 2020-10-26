import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:owomaniya/viewmodels/splash_view_model.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Lottie.asset('assets/lottie/login.json'),
                ),
              ),
            ),
            RaisedButton(
              child: Text('Walk Through'),
              onPressed: () => model.navigateToWalkThrough(),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => SplashViewModel(),
      onModelReady: (model) {
        SchedulerBinding.instance
            .addPostFrameCallback((timestamp) => timestamp.inMilliseconds);
      },
    );
  }
}
