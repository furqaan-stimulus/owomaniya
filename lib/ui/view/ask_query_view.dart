import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owomaniya/viewmodels/ask_query_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:owomaniya/utils/size_config.dart';

class AskQueryView extends StatefulWidget {
  @override
  _AskQueryViewState createState() => _AskQueryViewState();
}

class _AskQueryViewState extends State<AskQueryView> {
  final queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AskQueryViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              body: Container(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(26.0),
                      child: Container(
                        child: Wrap(
                          runSpacing: 10.0,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 8.0, 0.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/ask_expert_pink.svg',
                                      width: 45,
                                      height: 45,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      'Ask an Expert',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
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
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: SvgPicture.asset(
                                            'assets/svg/check_pink.svg',
                                            height: 15.0,
                                            width: 15.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Text(
                                              '100% Anonymous.Your identity is hidden.'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: SvgPicture.asset(
                                            'assets/svg/check_pink.svg',
                                            height: 15.0,
                                            width: 15.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Text(
                                              'Get a free follow-up with the expert.'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: SvgPicture.asset(
                                            'assets/svg/check_pink.svg',
                                            height: 15.0,
                                            width: 15.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Text(
                                              'Private and safe chat. Stay healthy'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, top: 8.0, bottom: 8.0),
                                          child: SvgPicture.asset(
                                            'assets/svg/anyonmans.svg',
                                            height: 30,
                                            width: 30,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Text(
                                            'You (Anonymous)',
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0.0, 10.0, 0.0, 20.0),
                                      child: TextField(
                                        controller: queryController,
                                        maxLines: null,
                                        decoration: InputDecoration(
                                            hintText: 'Type your query here...',
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey))),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, bottom: 10.0),
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
                                          padding: EdgeInsets.fromLTRB(
                                              20.0, 14.0, 20.0, 14.0),
                                          onPressed: () {
                                            model.navigateToSignUpView();
                                            // model.askQueryPost(
                                            //     queryController.text);
                                            print('tap');
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
            ),
        viewModelBuilder: () => AskQueryViewModel());
  }
}
