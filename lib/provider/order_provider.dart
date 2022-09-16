import 'package:ecommerce/api_services/api_service.dart';
import 'package:ecommerce/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> orderlist = [];
  Future getOrderData() async {
    orderlist = await ApiService().fatchOrderData();
    notifyListeners();
  }
}
