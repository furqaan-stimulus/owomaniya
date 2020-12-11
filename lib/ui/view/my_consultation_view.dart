import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owomaniya/model/query_consultation_model.dart';
import 'package:owomaniya/utils/date_time_ago.dart';
import 'package:owomaniya/viewmodels/my_consultation_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'package:owomaniya/utils/api_urls.dart';

class MyConsultationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyConsultationViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('My Consultation'),
        ),
        body: Container(
          child: FutureBuilder<QueryConsultationModel>(
            future: getQueryConsultation(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.data?.length ?? 0,
                  itemBuilder: (context, fIndex) {
                    return ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.data[fIndex].details.authordetails.length,
                      itemBuilder: (context, sIndex) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 5.0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Posted ${DateTimeAgo.timeAgoSinceDate('${snapshot.data.data[fIndex].feedDate}')}',
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                              maxLines: 3,
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Text(
                                              snapshot.data.data[fIndex].feedTitle,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                              maxLines: 3,
                                              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                            child: SvgPicture.asset('assets/svg/tag_inactive.svg'),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                                decoration:
                                                    BoxDecoration(border: Border.all(color: Colors.black)),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(12.0),
                                                  child: Text('Expert will be assigned to you soon...'),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              } else {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Loading..'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LinearProgressIndicator(),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
      viewModelBuilder: () => MyConsultationViewModel(),
      onModelReady: (model) {
        model.getQueryConsultation();
      },
    );
  }

  Future<QueryConsultationModel> getQueryConsultation() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    http.Response response;
    response = await http.get(
      ApiUrls.GET_QUERY_CONSULTATION_OF_USER_URL + token,
    );
    final jsonString = json.decode(response.body);
    QueryConsultationModel model = QueryConsultationModel.fromJson(jsonString);
    print(model.data.length);
    return model;
  }
}
