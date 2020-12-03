import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:owomaniya/utils/size_config.dart';
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
    SizeConfig().init(context);
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
                  height: SizeConfig.blockSizeHorizontal * 100,
                  width: SizeConfig.blockSizeVertical * 100,
                  child: Image.asset('assets/images/ow_symbol.png'),
                ),
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => SplashViewModel(),
      onModelReady: (model) {
        // SchedulerBinding.instance
        //     .addPostFrameCallback((_) => model.initialised);
        // model.isUserSignedIn();
        Future.delayed(
          Duration(seconds: 2),
          () {
            model.navigateToWalkThrough();
          },
        );
      },
    );
  }
}
