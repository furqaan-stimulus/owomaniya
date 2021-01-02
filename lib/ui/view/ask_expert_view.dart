import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owomaniya/viewmodels/ask_expert_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AskExpertView extends StatefulWidget {
  final String doctorName;
  final String expertiseField;
  final String doctorImage;

  const AskExpertView({Key key, this.doctorName, this.expertiseField, this.doctorImage})
      : super(key: key);

  @override
  _AskExpertViewState createState() => _AskExpertViewState(doctorName, expertiseField, doctorImage);
}

class _AskExpertViewState extends State<AskExpertView> {
  final String doctorName;
  final String expertiseField;
  final String doctorImage;

  Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  _AskExpertViewState(this.doctorName, this.expertiseField, this.doctorImage);

  @override
  Widget build(BuildContext context) {
    final queryController = TextEditingController();
    bool _validate = false;
    return ViewModelBuilder<AskExpertViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Container(
              child: IconButton(
                icon: SvgPicture.asset(
                  'assets/svg/ask_expert_pink.svg',
                  width: 45,
                  height: 45,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            title: Text(
              "Ask $doctorName Query",
              style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          body: Container(
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0,20,10.0,0.0),
                  child: Container(
                    child: Wrap(
                      runSpacing: 5.0,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage("$doctorImage"),
                              radius: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    doctorName,
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/svg/sidebar_query.svg',
                                          height: 14,
                                          width: 14,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          expertiseField,
                                          style: TextStyle(color: Colors.black, fontSize: 14.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: SvgPicture.asset(
                                          'assets/svg/wallet_blk.svg',
                                          height: 14,
                                          width: 14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4.0),
                                        child: Text(
                                          "Consultation Fees \u20B9 99",
                                          style: TextStyle(color: Colors.black, fontSize: 14.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/check_pink.svg',
                                      height: 20.0,
                                      width: 20.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        '100% Anonymous.Your identity is hidden.',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/check_pink.svg',
                                      height: 20.0,
                                      width: 20.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        'Get a free follow-up with the expert.',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/check_pink.svg',
                                      height: 20.0,
                                      width: 20.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        'Private and safe chat. Stay healthy',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Divider(
                                  color: Colors.grey,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 20.0),
                                  child: TextField(
                                    controller: queryController,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                        errorText: _validate ? "Query can\'t be empty" : null,
                                        hintText: 'Type your query here...',
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey))),
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                                  child: Container(
                                    child: RaisedButton.icon(
                                      icon: SvgPicture.asset(
                                        'assets/svg/send.svg',
                                        height: 20,
                                        width: 20,
                                      ),
                                      label: Text(
                                        "SEND",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                      textColor: Colors.white,
                                      padding: EdgeInsets.fromLTRB(20.0, 14.0, 20.0, 14.0),
                                      onPressed: () {
                                        setState(() {
                                          if (queryController.text.isEmpty) {
                                            _validate = true;
                                          } else {
                                            _validate = false;
                                            // model.askQueryPost(queryController.text);
                                          }
                                        });
                                      },
                                      color: Colors.pink,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Disclaimer: Information provide by an expert here is for general informational purpose only and it should NOT be considered as a substitute for professional expert (medical,psychological or fitness advice) as complete physical assessment of an individual has not been done. Please consult your nearest doctor/expert before acting on it. The advice is also not valid for medico-legal purposes.',
                                  style: TextStyle(
                                    color: Colors.pink,
                                  ),
                                  textAlign: TextAlign.left,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => AskExpertViewModel(),
    );
  }
}
