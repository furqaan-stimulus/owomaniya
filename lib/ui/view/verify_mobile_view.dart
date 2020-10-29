import 'package:flutter/material.dart';
import 'package:owomaniya/viewmodels/verify_mobile_view_model.dart';
import 'package:stacked/stacked.dart';

class VerifyMobileView extends StatefulWidget {
  @override
  _VerifyMobileViewState createState() => _VerifyMobileViewState();
}

class _VerifyMobileViewState extends State<VerifyMobileView> {
  final _mobileNumberController = TextEditingController();
  final _countryCodeController = TextEditingController();

  FocusNode _focusNodeMobileNumber = new FocusNode();
  FocusNode _focusNodeCountryCode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerifyMobileViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              controller: _countryCodeController,
                              focusNode: _focusNodeCountryCode,
                              decoration: InputDecoration(
                                labelText: "Code",
                                hintText: "Country code",
                                fillColor: Color(0xFF2CB044),
                              ),
                            ),
                            flex: 1,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _mobileNumberController,
                              focusNode: _focusNodeMobileNumber,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: "Mobile Number",
                                hintText: "Mobile number",
                                fillColor: Color(0xFF2CB044),
                                prefixIcon: Icon(Icons.mobile_screen_share),
                              ),
                            ),
                            flex: 5,
                          ),
                        ],
                      ),
                      new SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: double.infinity,
                        child: FlatButton(
                          child: Text("Request Otp"),
                          textColor: Colors.white,
                          padding: EdgeInsets.all(16),
                          onPressed: () {
                            final code = _countryCodeController.text.trim();
                            final phone = _mobileNumberController.text.trim();
                            // model.submitMobileNumber(code, phone, context);
                            print('code $code and phone $phone');
                          },
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => VerifyMobileViewModel());
  }
}
