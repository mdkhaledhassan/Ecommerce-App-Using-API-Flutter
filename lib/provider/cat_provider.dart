import 'package:ecommerce/api_services/api_service.dart';
import 'package:ecommerce/model/cat_model.dart';
import 'package:ecommerce/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatProvider with ChangeNotifier {
  List<CatModel> catlist = [];
  Future getCatData() async {
    catlist = await ApiService().fatchCatData();
    notifyListeners();
  }
}
