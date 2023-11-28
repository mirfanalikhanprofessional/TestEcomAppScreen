

import 'dart:convert' as convert;


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../environment.dart';
import '../../../helpers/network_utility.dart';
import '../../common/models/product_model.dart';

class AllProductsUtility {

  Future<ProductList> getAllProductsData(BuildContext context) async {
    Uri uriEndPoint = Uri.parse("${environment['domain']}/products");
    try {
      var response = await NetworkUtility().httpGetRequestWithoutHeaderWithoutBody(uriEndPoint);
      if (response.statusCode == 200) {
        List<dynamic> body = convert.jsonDecode(response.body);
        if (kDebugMode) {
          if (kDebugMode) {
            if (kDebugMode) {
              print(body);
            }
          }
        }
        ProductList productList = ProductList.fromJson(body);
        return productList;
      }
    }
    catch(error, trace) {
        if (kDebugMode) {
          print(error);
        }
        if (kDebugMode) {
          print(trace);
        }
    }
    return ProductList(products: []);
  }
}