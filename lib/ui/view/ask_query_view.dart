import 'package:flutter/material.dart';
import 'package:owomaniya/viewmodels/ask_query_view_model.dart';
import 'package:stacked/stacked.dart';

class AskQueryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AskQueryViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text('Ask an Expert'),
              ),
              body: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, top: 8.0, right: 4.0, bottom: 8.0),
                child: Container(
                  child: Wrap(
                    runSpacing: 10.0,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Divider(
                                color: Colors.grey,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Icon(
                                      Icons.check_circle,
                                      color: Colors.pink,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
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
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Icon(
                                      Icons.check_circle,
                                      color: Colors.pink,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
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
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Icon(
                                      Icons.check_circle,
                                      color: Colors.pink,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
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
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Icon(
                                      Icons.account_circle,
                                      color: Colors.grey,
                                      size: 70.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      'You (Anonymous)',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
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
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  maxLines: 6,
                                  decoration: InputDecoration(
                                      hintText: 'Type your query here...',
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey))),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  child: RaisedButton.icon(
                                    icon: Icon(Icons.send),
                                    label: Text(
                                      "SEND",
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                    textColor: Colors.white,
                                    padding: EdgeInsets.fromLTRB(
                                        30.0, 14.0, 30.0, 14.0),
                                    onPressed: () {
                                      model.navigateToSignUpView();
                                    },
                                    color: Colors.pink,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Text(
                                  'Disclaimer: Information provide by an expert here is for general informational purpose only and it should NOT be considered as substitute for professional expert(medical,psychological or fitness advice) as complete physical assessment of an individual has not been done.',
                                  style: TextStyle(color: Colors.pink),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => AskQueryViewModel());
  }
}
