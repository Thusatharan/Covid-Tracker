import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:corona_stats/Models/DataModel.dart';

Future getSinglePostData(context) async {
  DataModel stats;
  // Map result;
  String baseUrl = "https://www.hpb.health.gov.lk/api/get-current-statistical";

  try {
    final response = await http.get(baseUrl, headers: {
      HttpHeaders.contentTypeHeader: "application/json",
    });

    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      // print(item['data']);
      stats = DataModel.fromJson(item['data']);
      // return stats;
    } else {
      print("Data not found");
    }
  } catch (e) {
    print(e);
  }
  return stats;
}
