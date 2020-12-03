import 'package:flutter/material.dart';
import 'package:owomaniya/viewmodels/consultation_view_model.dart';
import 'package:stacked/stacked.dart';

class ConsultationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ConsultationViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
        ),
        viewModelBuilder: () => ConsultationViewModel());
  }
}
