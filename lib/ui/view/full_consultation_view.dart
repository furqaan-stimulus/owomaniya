import 'package:flutter/material.dart';
import 'package:owomaniya/viewmodels/full_consultation_view_model.dart';
import 'package:stacked/stacked.dart';

class FullConsultationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FullConsultationViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text("Consultation View"),
              ),
            ),
        viewModelBuilder: () => FullConsultationViewModel());
  }
}
