import 'dart:convert';

import 'package:ecommerce/model/cat_model.dart';
import 'package:ecommerce/model/order_model.dart';
import 'package:ecommerce/model/profile_model.dart';
import 'package:ecommerce/widgets/const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const Map<String, String> defaultHeader = {
    "Accept": "application/json"
  };

  Future<Map<String, String>> getHeaderWithToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var map = {
      "Accept": "application/json",
      "Authorization": "bearer ${sharedPreferences.getString("token")}"
    };
    print("User token is: ${sharedPreferences.getString("token")}");
    return map;
  }

  Future<String> loginUser(String email, String password) async {
    var sign_in_link = "${api_link}api/admin/sign-in";
    var user_map = Map<String, dynamic>();
    user_map["email"] = email;
    user_map["password"] = password;
    var responce = await http.post(Uri.parse(sign_in_link),
        body: user_map, headers: defaultHeader);
    print("${responce.body}");

    if (responce.statusCode == 200) {
      showToast("Login Successfull");
      return responce.body;
    } else {
      showToast("Invalid email or password");
      return "Something is wrong";
    }
  }

  Future<List<OrderModel>> fatchOrderData() async {
    List<OrderModel> orderlist = [];
    OrderModel orderModel;
    try {
      var order_api_link = "${api_link}api/admin/all/orders";
      var response = await http.get(Uri.parse(order_api_link),
          headers: await getHeaderWithToken());
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var i in data) {
          orderModel = OrderModel.fromJson(i);
          orderlist.add(orderModel);
        }
        return orderlist;
      } else {
        showToast("Something is wrong");
        return orderlist;
      }
    } catch (e) {
      print(e);
      return orderlist;
    }
  }

  Future<List<CatModel>> fatchCatData() async {
    List<CatModel> catlist = [];
    CatModel catModel;
    try {
      var cat_api_link = "${api_link}api/admin/category";
      var response = await http.get(Uri.parse(cat_api_link),
          headers: await getHeaderWithToken());
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var i in data) {
          catModel = CatModel.fromJson(i);
          catlist.add(catModel);
        }
        return catlist;
      } else {
        showToast("Something is wrong");
        return catlist;
      }
    } catch (e) {
      print(e);
      return catlist;
    }
  }

  Future<String> fatchProfileData() async {
    var sign_in_link = "${api_link}api/admin/profile";
    var map = Map<String, dynamic>();
    var responce =
        await http.get(Uri.parse(sign_in_link), headers: defaultHeader);
    print("${responce.body}");

    var data = jsonDecode(responce.body);

    if (responce.statusCode == 200) {
      return data;
    } else {
      return "Something is wrong";
    }
  }
}
