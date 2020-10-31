import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:owomaniya/viewmodels/splash_view_model.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
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
          ],
        ),
      ),
      viewModelBuilder: () => SplashViewModel(),
      onModelReady: (model) {
        Future.delayed(Duration(seconds: 4), () {
          model.navigateToWalkThrough();
        });
      },
    );
  }
}
