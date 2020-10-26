import 'package:flutter/material.dart';
import 'package:owomaniya/utils/styles.dart';
import 'package:owomaniya/viewmodels/signup_view_model.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text('Sign up'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text('SignUp',style: TextStyle(fontSize: 20),)),
            ],
          ),
        ),
        viewModelBuilder: () => SignUpViewModel());
  }
}
