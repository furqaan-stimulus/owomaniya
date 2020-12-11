import 'dart:convert';
import 'package:owomaniya/model/query_consultation_model.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyConsultationViewModel extends BaseModel {

  // Future<QueryConsultationModel> getQueryConsultation() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   var token = preferences.getString('token');
  //   http.Response response;
  //   if (token == null) {
  //     response = await http.get(ApiUrls.GET_QUERY_CONSULTATION_OF_USER_URL + token);
  //     final jsonString = json.decode(response.body);
  //     QueryConsultationModel model = QueryConsultationModel.fromJson(jsonString);
  //     return model;
  //   }
  //   return jsonDecode(response.body);
  // }


  Future<QueryConsultationModel> getQueryConsultation() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
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
