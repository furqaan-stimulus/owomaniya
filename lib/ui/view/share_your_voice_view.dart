import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owomaniya/viewmodels/share_your_voice_view_model.dart';
import 'package:stacked/stacked.dart';

class ShareYourVoiceView extends StatefulWidget {
  @override
  _ShareYourVoiceViewState createState() => _ShareYourVoiceViewState();
}

class _ShareYourVoiceViewState extends State<ShareYourVoiceView> {
  final shortStoryController = TextEditingController();

  final aboutYouController = TextEditingController();
  bool _emptyStory = false;
  bool _emptyAbout = false;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShareYourVoiceViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/svg/share_voice_head.svg',
              width: 35,
              height: 35,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            "Share Your Story",
            style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 20, 10.0, 0.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 15.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/search_articles.svg',
                                  width: 50,
                                  height: 50,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  'Share Your Story',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                            ),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: shortStoryController,
                              maxLines: null,
                              decoration: InputDecoration(
                                errorText: _emptyStory ? "Story can\'t be empty" : null,
                                hintText: 'Start Typing Your Story',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                      elevation: 5.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 15.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/search_articles.svg',
                                  width: 50,
                                  height: 50,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  'About You',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                            ),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: aboutYouController,
                              maxLines: null,
                              decoration: InputDecoration(
                                errorText: _emptyAbout ? "About You can\'t be empty" : null,
                                hintText: 'Mention Something About You',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                      elevation: 5.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: RaisedButton(
                          child: Text(
                            "Submit Story",
                            style: TextStyle(fontSize: 15.0),
                          ),
                          textColor: Colors.white,
                          padding: EdgeInsets.fromLTRB(20.0, 14.0, 20.0, 14.0),
                          onPressed: () {
                            setState(() {
                              if (shortStoryController.text.isEmpty) {
                                _emptyStory = true;
                              } else if (aboutYouController.text.isEmpty) {
                                _emptyAbout = true;
                              } else if (shortStoryController.text.isNotEmpty &&
                                  aboutYouController.text.isEmpty) {
                                _emptyStory = false;
                                _emptyAbout = true;
                              } else if (shortStoryController.text.isEmpty &&
                                  aboutYouController.text.isNotEmpty) {
                                _emptyStory = true;
                                _emptyAbout = false;
                              } else {
                                _emptyAbout = false;
                                _emptyStory = false;
                                model.shareVoice(
                                    shortStoryController.text, aboutYouController.text);
                              }
                            });
                          },
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => ShareYourVoiceViewModel(),
    );
  }
}
