import 'package:ecommerce/api_services/api_service.dart';
import 'package:ecommerce/model/cat_model.dart';
import 'package:ecommerce/model/order_model.dart';
import 'package:ecommerce/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileProvider with ChangeNotifier {
  var data;
  Future getProfileData() async {
    data = await ApiService().fatchProfileData().toString();
    notifyListeners();
  }
}
