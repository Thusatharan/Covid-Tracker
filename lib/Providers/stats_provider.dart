import 'package:corona_stats/Api/data_api_request.dart';
import 'package:corona_stats/Models/DataModel.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class StatsProvider with ChangeNotifier {
  DataModel post = DataModel();
  bool loading = false;

  getPostData(context) async {
    loading = true;
    post = await getSinglePostData(context);
    loading = false;

    notifyListeners();
  }
}
